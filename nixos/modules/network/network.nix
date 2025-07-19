{ ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 5900 ];
      allowedUDPPorts = [ 59010 59011 ];
      allowPing = true;
    };
  };
  services.resolved = {
    enable = true;
  };
}
