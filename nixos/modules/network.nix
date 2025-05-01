{ pkgs, ... }: {
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
    };
  };

  services.resolved = {
    enable = true;
  };
}