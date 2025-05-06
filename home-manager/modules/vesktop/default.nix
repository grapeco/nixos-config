{ osConfig, config, pkgs, lib, ... }:

with config.lib.stylix.colors.withHashtag;

let
  opacity = 0.8;
  floatToHex = n: lib.trivial.toHexString (builtins.floor (n * 255));
  half-opacity-hex = lib.trivial.toHexString (builtins.floor (opacity * 127));
  opacity-hex = floatToHex opacity;
  theme = ''
    /**
      * @name Catppuccin Mocha
      * @author winston#0001
      * @authorId 505490445468696576
      * @version 0.2.0
      * @description 🎮 Soothing pastel theme for Discord
      * @website https://github.com/catppuccin/discord
      * @invite r6Mdz5dpFc
      *
    **/

    @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");
  '';

  theme-file = pkgs.writeTextFile {
    name = "theme.css";
    text = theme;
  };
  
in

{
  xdg.configFile = {
    "vesktop/themes/theme.css" = {
      source = theme-file;
      force = true;
    };
  };
}
