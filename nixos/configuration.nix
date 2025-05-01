{ config, lib, pkgs, inputs, user, homeStateVersion, ... }:

{
  imports = [  
    ./hardware-configuration.nix
    ./modules

    inputs.home-manager.nixosModules.default
  ];

  home-manager.backupFileExtension = "backup";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8"];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = ["nvidia"];
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "libvirtd"]; 
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  swapDevices = [ 
    {
      device = "/.swapvol/swapfile";
    }
  ];

  system.stateVersion = "24.11"; # Do not
}