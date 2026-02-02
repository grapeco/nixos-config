{ pkgs, stateVersion, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules
    ./modules
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_TIME = "en_GB.UTF-8";
  };

  powerManagement.cpuFreqGovernor = "performance";

  swapDevices = [
    {
      device = "/.swapvol/swapfile";
    }
  ];
  
  system.stateVersion = stateVersion;
}
