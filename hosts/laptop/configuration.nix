{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "en_GB.UTF-8";
  };
  
  system.stateVersion = "25.11";
}
