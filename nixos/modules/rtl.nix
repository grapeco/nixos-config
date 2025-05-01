{ config, lib, pkgs, inputs, ... }:

let
  rtl8192eu-linux-driver = pkgs.stdenv.mkDerivation {
    name = "rtl8192eu-linux-driver";
    
    src = pkgs.fetchFromGitHub {
      owner = "Mange";
      repo = "rtl8192eu-linux-driver";
      rev = "73f5c4359a6e9f680a533fb7140b169f002499cb"; # Последний коммит
      sha256 = "12j0wv88d1wzi0gmp37riar2q1fsxn6d9ly0n1kjm0rgvyraa9rk"; # Замените на реальный хеш
    };

    nativeBuildInputs = with pkgs; [
      bc
      linuxHeaders
      gcc
    ];

    buildInputs = with pkgs; [
      linuxHeaders
    ];

    makeFlags = [
      "KSRC=${config.boot.kernelPackages.kernel.dev}/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/build"
    ];

    installPhase = ''
      mkdir -p $out/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/kernel/drivers/net/wireless
      cp 8192eu.ko $out/lib/modules/${config.boot.kernelPackages.kernel.modDirVersion}/kernel/drivers/net/wireless
    '';
  };
in
{
  boot = {
    extraModulePackages = [ rtl8192eu-linux-driver ];
    kernelModules = [ "8192eu" ];
    blacklistedKernelModules = [ "rtl8xxxu" ];
  };
}