{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (callPackage ./package.nix {})
  ];
  
  services.displayManager.sddm = {
    enable = true;
    # wayland.enable = true;
    theme = "pixel-night-city";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qt5compat
    ];
  };
}
