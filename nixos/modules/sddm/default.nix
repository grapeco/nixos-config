{ pkgs, ... }:

let
in {
  environment.systemPackages = with pkgs; [
    (sddm-astronaut.override {
      embeddedTheme = "hyprland_kath";
    })
  ];
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
    ];
  };
}
