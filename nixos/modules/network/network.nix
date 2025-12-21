{ ... }: {
  networking = {
    hostName = "nixos";
    nameservers = [ "9.9.9.9" "149.112.112.112" ];
    networkmanager = {
      enable = true;
      # wifi.backend = "iwd";
    };
  };
  services.resolved = {
    enable = true;
    fallbackDns = [ "" ];
    dnsovertls = "true";
    dnssec = "true";
  };
}
