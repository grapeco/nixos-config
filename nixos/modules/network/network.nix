{ ... }: {
  networking = {
    hostName = "nixos";
    nameservers = [ "9.9.9.9#dns.quad9.net" ];
    networkmanager.enable = true;
  };
  services.resolved = {
    enable = true;
    fallbackDns = [ "" ];
    dnsovertls = "true";
    dnssec = "true";
  };
}
