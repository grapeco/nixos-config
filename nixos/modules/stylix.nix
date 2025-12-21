{ pkgs, inputs, config, ... }:
let
  opacity = config.theming.opacity;
in {
  imports = [ inputs.stylix.nixosModules.stylix ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    font-awesome
    nerd-fonts.symbols-only
    corefonts
  ];

  environment.systemPackages = with pkgs; [
    papirus-icon-theme
    pcmanfm-qt
  ];

  stylix = {
    enable = true;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    targets = {
      grub.enable = false;
    };

    cursor = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    opacity = {
      terminal = opacity;
      popups = opacity;
      desktop = opacity;
      applications = opacity;
    };

    fonts = {
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-color-emoji;
      };
      monospace = {
        name = "JetBrains Mono";
        package = pkgs.jetbrains-mono;
      };
      sansSerif = {
        name = "Noto Sans";
        package = pkgs.noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = pkgs.noto-fonts;
      };

      sizes = {
        terminal = 13;
        applications = 11;
      };
    };

    iconTheme = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    # image = ../../../screenshots/NixOs.png;
  };
}
