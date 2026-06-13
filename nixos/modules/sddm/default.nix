{ pkgs, inputs, ... }:
{
  imports = [
    inputs.qylock.nixosModules.default  
  ];
  
  environment.systemPackages = with pkgs; [
    (sddm-astronaut.override {
      embeddedTheme = "black_hole";
    })
  ];
  
  services.displayManager.sddm = {
    enable = true;
    # wayland.enable = true;
    # theme = "sddm-astronaut-theme";
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qtmultimedia
      kdePackages.qtsvg
    ];
  };
  
  programs.qylock = {
    enable = true;
    theme = "pixel-night-city";          # any directory name under themes/
    sddm.enable = true;             # installs theme + sets it active (default)
    # quickshell.enable = true;       # adds `qylock-lock` to PATH (default)

    # Optional per-theme tweaks (replaces the interactive prompts):
    # themeOptions = {
    #   terraria.backgroundMode = "time";              # time | random | static
    #   Genshin.backgroundMode = "time";
    #   clockwork.orbital = { themeMode = "dark"; enableWindup = true; };
    #   osu.gameMode = "menu";                         # menu | game
    # };
  };
}
