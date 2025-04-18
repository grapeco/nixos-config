{ config, lib, pkgs, inputs, user, homeStateVersion, ... }:

{
  imports = [  
    ./hardware-configuration.nix
    ./rtl.nix
    ./grub.nix
    ./network.nix
    ./ssh.nix
    ./bash.nix
    ./sddm.nix
    ./bluetooth.nix
    ./steam.nix
    ./hardware.nix
    ./hyprland.nix
    inputs.home-manager.nixosModules.default
  ];

  home-manager.backupFileExtension = "backup";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8"];

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = ["nvidia"];
  };

  users.users.${user} = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"]; 
    packages = with pkgs; [
      tree
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    vim 
    usbutils
    (jdk.override {
      enableJavaFX = true;
      openjfx21 = openjfx.override { withWebKit = true; };
    })
    appimage-run


    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.11"; # Do not
}