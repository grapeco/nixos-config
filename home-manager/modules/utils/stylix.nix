{ pkgs, inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];
  
  stylix = {
    # enable = true;
    polarity = "dark";
    image = ../../../screenshots/NixOs.png;

    targets = {
      firefox.profileNames = [ "default" ];
    };
    
    cursor = {
      name = "Bibata-Modern-Classic";
      size = 24;
      package = pkgs.bibata-cursors;
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
  };
}
