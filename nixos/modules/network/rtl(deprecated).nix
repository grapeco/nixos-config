{ config, pkgs, ... }:
{
  boot.blacklistedKernelModules = [ "rtl8xxxu" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.rtl8192eu ];
}
