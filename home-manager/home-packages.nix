{ pkgs, ... }:
{
  # nixpkgs.config.allowUnfree = true;
  # nixpkgs.overlays = [ inputs.nix4vscode.overlays.forVscode ];

  home.packages = with pkgs; [
    cava
    git 
    vesktop
    waybar
    rofi
    starship    
    eza
    alacritty
    kitty
    vesktop
    swaynotificationcenter
    zed-editor-fhs
    fish
  ];
}
