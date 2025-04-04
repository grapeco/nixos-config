{ config, lib, pkgs, inputs, ... }:

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
    inputs.home-manager.nixosModules.default
  ];

  home-manager.backupFileExtension = "backup";

  hardware.enableAllFirmware = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8"];

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = ["nvidia"];
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  users.users.nox = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager"]; 
    packages = with pkgs; [
      tree
    ];
  };

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim 
    usbutils
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
  ];

  nixpkgs.config.allowUnfree = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

