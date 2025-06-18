{ ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 ];
      allowedUDPPorts = [ 59010 59011 ];
    };
  };
  services.resolved = {
    enable = true;
  };
}
