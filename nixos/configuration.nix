{ config, lib, pkgs, inputs, user, homeStateVersion, ... }:

{
  imports = [  
    ./hardware-configuration.nix
    ./rtl.nix
    ./grub.nix
    ./network.nix
    ./ssh.nix
    ./bash.nix
    ./bluetooth.nix
    ./steam.nix
    ./hardware.nix
    ./hyprland.nix
    ./sound.nix
    # ./wireguard.nix
    
    ./sddm

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

  environment.systemPackages = with pkgs; [
    vim 
    usbutils
    jdk
    appimage-run
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Do not

  swapDevices = [ 
    {
      device = "/.swapvol/swapfile";
    }
  ];
}