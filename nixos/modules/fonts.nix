{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    font-awesome
    nerd-fonts.symbols-only
    corefonts
  ];
  
  fonts.fontconfig = {
    defaultFonts = {
      serif = ["Noto Serif"];
      sansSerif = ["Noto Sans"];
      monospace = ["JetBrainsMono"];
    };
  };

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
  ];
}
