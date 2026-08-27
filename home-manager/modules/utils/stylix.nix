{ inputs, ... }:
{
  imports = [ inputs.stylix.homeModules.stylix ];
  
  stylix = {
    enable = true;
    # autoEnable = true;
    polarity = "dark";
    base16Scheme = ./theme.yaml;

    targets = {
      waybar.enable = false;
      hyprlock.enable = false;
      qt.enable = true;
      firefox.profileNames = [ "default" ];
    };
  };
}
