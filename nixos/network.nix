{ pkgs, ... }: {
  networking = {
    hostName = "nixos";
    firewall.allowedTCPPorts = [ 22 ];
    networkmanager = {
      enable = true;
    };
  };

  services.resolved = {
    enable = true;
  };
}