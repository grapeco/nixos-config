{ pkgs, user, ... }:
{
  environment.systemPackages = with pkgs; [
    vim 
    usbutils
    jdk
    appimage-run
  ];

  nixpkgs.config.allowUnfree = true;
}