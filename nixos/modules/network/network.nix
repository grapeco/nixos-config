{ ... }: {
  networking = {
    hostName = "nixos";
    nameservers = [ "9.9.9.9" ];
    networkmanager.enable = true;
  };
  services.resolved = {
    enable = true;
    fallbackDns = [ "" ];
    dnsovertls = "true";
    dnssec = "true";
    extraConfig = ''
      Cache=yes
    '';
  };
}
