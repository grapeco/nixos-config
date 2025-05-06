{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (pkgs.callPackage ./sddm-astronaut-theme.nix {
      theme = "hyprland_kath";
    })
    # sddm-chili-theme
  ];

  services.displayManager.sddm = {
    enable = true;
    theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
      kdePackages.qtsvg
      kdePackages.qtvirtualkeyboard
    ];
  };
}