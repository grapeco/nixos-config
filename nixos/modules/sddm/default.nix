{ pkgs, user, ... }: 

let 
in {
  environment.systemPackages = with pkgs; [
    (pkgs.callPackage ./sddm-astronaut-theme.nix {
      theme = "hyprland_kath";
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