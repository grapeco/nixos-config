{ config, pkgs, lib, ... }:

## Config from https://github.com/Maroka-chan/VPN-Confinement/
let
  inherit (lib) concatMapStrings;
  inherit (builtins) toString concatStringsSep;
  inherit (lib)
    optionalString
  ;

  isIPv6Enabled = config.networking.enableIPv6;
  optionalIPv6String = x: optionalString isIPv6Enabled x;

  portMappings = [
    {
      from = 9091;
      to = 9091;
      protocol = "tcp";
    }
  ];

  generatePreroutingRules =
  table: namespaceAddress: namespaceAddressIPv6: portMappings:
    concatStringsSep "\n" (map (portMap:
      concatMapStrings (protocol:
      ''
        iptables -t nat -A ${table} -p ${protocol} \
        --dport ${toString portMap.from} \
        -j DNAT --to-destination \
        ${namespaceAddress}:${toString portMap.to}
      '' + optionalIPv6String ''
        ip6tables -t nat -A ${table} -p ${protocol} \
        --dport ${toString portMap.from} \
        -j DNAT --to-destination \
        \[${namespaceAddressIPv6}\]:${toString portMap.to}
      ''
      )
      (if portMap.protocol == "both"
        then [ "tcp" "udp" ]
        else [ portMap.protocol ]
      )
    ) portMappings);

  addNetNSIPRules = netns: argset: concatStringsSep "\n"
    (map (args: ''
      ip netns exec ${netns} iptables ${args}
    '' + optionalIPv6String ''
      ip netns exec ${netns} ip6tables ${args}
    '') argset);

  netnsName = "wg";

  accessibleFrom = [
    "192.168.0.0/24"
  ];
  
  namespaceAddress = "192.168.15.1";
  namespaceAddressIPv6 = "fd93:9701:1d00::2";
  bridgeAddress = "192.168.15.5";
  bridgeAddressIPv6 = "fd93:9701:1d00::1";
  

  wg-up = pkgs.writeShellApplication {
    name = "${netnsName}-up";
    runtimeInputs = with pkgs; [
      bash
      iproute2
      iptables
      unixtools.ping
      wireguard-tools
    ];
    text = ''
      if [[ $(ip netns list) == *"wg"* || $(ip link list) == *"wg-br"* ]]; then
        set +o errexit

        ip netns del ${netnsName}
        ip link del ${netnsName}-br
        ip link del veth-${netnsName}-br
        rm -rf /etc/netns/${netnsName}

        # Delete prerouting rules
        while read -r rule
        do
          # shellcheck disable=SC2086
          iptables -t nat -D ''${rule#* }
        done < <(iptables -t nat -S | awk '/${netnsName}-prerouting/ && !/-N/')

        ${optionalIPv6String ''
        while read -r rule
        do
          # shellcheck disable=SC2086
          ip6tables -t nat -D ''${rule#* }
        done < <(ip6tables -t nat -S | awk '/${netnsName}-prerouting/ && !/-N/')
        ''}

        iptables -t nat -X ${netnsName}-prerouting
        ${optionalIPv6String ''
        ip6tables -t nat -X ${netnsName}-prerouting
        ''}
      fi

      ip netns add ${netnsName} || true

      # Set up netns firewall
      ${addNetNSIPRules netnsName [
        "-P INPUT DROP"
        "-P FORWARD DROP"
        "-A INPUT -i lo -j ACCEPT"
        "-A INPUT -m conntrack --ctstate INVALID -j DROP"
        "-A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT"
      ]}

      ${optionalIPv6String
        "ip netns exec ${netnsName} ip6tables -A INPUT -p ipv6-icmp -j ACCEPT"
      }

      # Drop packets to unspecified DNS
      ${addNetNSIPRules netnsName [
        "-N dns-fw"
        "-A dns-fw -j DROP"
        "-I OUTPUT -p udp -m udp --dport 53 -j dns-fw"
      ]}

      # Set up the wireguard interface
      ip link add ${netnsName}0 type wireguard
      ip link set ${netnsName}0 netns ${netnsName}

      # Parse wireguard INI config file
      # shellcheck disable=SC1090
      source <( \
        grep -e "DNS" -e "Address" -e "Endpoint" ~/vena.conf \
          | tr -d ' ' \
      )

      # Add Addresses
      IFS=","
      # shellcheck disable=SC2154
      for addr in $Address; do
        ip -n ${netnsName} address add "$addr" dev ${netnsName}0
      done

      # Add DNS
      rm -rf /etc/netns/${netnsName}
      mkdir -p /etc/netns/${netnsName}
      IFS=","
      # shellcheck disable=SC2154
      for ns in $DNS; do
        echo "nameserver $ns" >> /etc/netns/${netnsName}/resolv.conf
        if [[ $ns == *"."* ]]; then
          ip netns exec ${netnsName} iptables \
            -I dns-fw -p udp -d "$ns" -j ACCEPT
        ${optionalIPv6String ''
        else
          ip netns exec ${netnsName} ip6tables \
            -I dns-fw -p udp -d "$ns" -j ACCEPT
        ''}
        fi
      done

      # Strips the config of wg-quick settings
      shopt -s extglob
      strip_wgquick_config() {
        CONFIG_FILE="$1"
        [[ -e $CONFIG_FILE ]] \
          || (echo "'$CONFIG_FILE' does not exist" >&2 && exit 1)
        CONFIG_FILE="$(readlink -f "$CONFIG_FILE")"
        local interface_section=0
        while read -r line || [[ -n $line ]]; do
          key=''${line//=/ }
          [[ $key == "["* ]] && interface_section=0
          [[ $key == "[Interface]" ]] && interface_section=1
          if [ $interface_section -eq 1 ] && [[ $key =~ \
            Address|MTU|DNS|Table|PreUp|PreDown|PostUp|PostDown|SaveConfig \
          ]]
          then
            continue
          fi
          WG_CONFIG+="$line"$'\n'
        done < "$CONFIG_FILE"
        echo "$WG_CONFIG"
      }

      # Wait for wireguard endpoint to be reachable
      # shellcheck disable=SC2154
      ## Vpn doesnt respond to a ping
      # until ping -c1 "''${Endpoint%%:*}" > /dev/null 2>&1; do
      #   sleep 1
      # done

      # Set wireguard config
      ip netns exec ${netnsName} \
        wg setconf ${netnsName}0 \
          <(strip_wgquick_config ~/vena.conf)

      ip -n ${netnsName} link set ${netnsName}0 up

      # Start the loopback interface
      ip -n ${netnsName} link set dev lo up

      # Create a bridge
      ip link add ${netnsName}-br type bridge
      ip addr add ${bridgeAddress}/24 dev ${netnsName}-br
      ${optionalIPv6String ''
      ip addr add ${bridgeAddressIPv6}/64 dev ${netnsName}-br
      ''}
      ip link set dev ${netnsName}-br up

      # Set up veth pair to link namespace with host network
      ip link add veth-${netnsName}-br type veth peer \
        name veth-${netnsName} netns ${netnsName}
      ip link set veth-${netnsName}-br master ${netnsName}-br
      ip link set dev veth-${netnsName}-br up

      ip -n ${netnsName} addr add ${namespaceAddress}/24 \
        dev veth-${netnsName}
      ${optionalIPv6String ''
      ip -n ${netnsName} addr add ${namespaceAddressIPv6}/64 \
        dev veth-${netnsName}
      ''}
      ip -n ${netnsName} link set dev veth-${netnsName} up

      # Add routes
      ip -n ${netnsName} route add default dev ${netnsName}0
      ${optionalIPv6String ''
      ip -6 -n ${netnsName} route add default dev ${netnsName}0
      ''}

      ${concatMapStrings (x: ''
        ip -n ${netnsName} route add ${x} via ${bridgeAddress}
      ''
      ) accessibleFrom}

      # Add prerouting rules
      iptables -t nat -N ${netnsName}-prerouting
      iptables -t nat -A PREROUTING -j ${netnsName}-prerouting
      ${optionalIPv6String ''
      ip6tables -t nat -N ${netnsName}-prerouting
      ip6tables -t nat -A PREROUTING -j ${netnsName}-prerouting
      ''}
      ${generatePreroutingRules "${netnsName}-prerouting"
        namespaceAddress namespaceAddressIPv6 portMappings}
    '';
  };

  wg-down = pkgs.writeShellApplication {
    name = "${netnsName}-down";
    runtimeInputs = with pkgs; [ iproute2 iptables gawk ];
    text = ''
      set +o errexit

      ip netns del ${netnsName}
      ip link del ${netnsName}-br
      ip link del veth-${netnsName}-br
      rm -rf /etc/netns/${netnsName}

      # Delete prerouting rules
      while read -r rule
      do
        # shellcheck disable=SC2086
        iptables -t nat -D ''${rule#* }
      done < <(iptables -t nat -S | awk '/${netnsName}-prerouting/ && !/-N/')

      ${optionalIPv6String ''
      while read -r rule
      do
        # shellcheck disable=SC2086
        ip6tables -t nat -D ''${rule#* }
      done < <(ip6tables -t nat -S | awk '/${netnsName}-prerouting/ && !/-N/')
      ''}

      iptables -t nat -X ${netnsName}-prerouting
      ${optionalIPv6String ''
      ip6tables -t nat -X ${netnsName}-prerouting
      ''}
    '';
  };
  
in
{
  systemd.services.wg = {
    description = "wg network interface";
    enable = true;
    requires = [ "network-online.target" ];
    after = [ "sops-nix.service" ];
    wantedBy = [ "multi-user.target" ];

    startLimitIntervalSec = 70;
    startLimitBurst = 5;

    serviceConfig = {
      Type = "idle";
      RemainAfterExit = true;
      ExecStart = "${wg-up}/bin/wg-up";
      ExecStop = "${wg-down}/bin/wg-down";
      SyslogLevel = "warning";

      Restart = "always";
      RestartSec = 10;
    };
  };
}