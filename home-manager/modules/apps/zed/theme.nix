{ config, lib, osConfig, ... }:
let
  floatToHex = n: lib.trivial.toHexString (builtins.floor (n * 255));
  opacity-hex = floatToHex (osConfig.theming.opacity);
in
with config.lib.stylix.colors.withHashtag;
{
  programs.zed-editor.userSettings = {
    "experimental.theme_overrides" = {
      "background.appearance" = "transparent";
      "background" = "${base00}${opacity-hex}";
      "panel.background" = "#00000000";
      "editor.background" = "${base00}${opacity-hex}";
      "tab_bar.background" = "${base00}${opacity-hex}";
      "terminal.background" = "#00000000";
      "toolbar.background" = "${base00}${opacity-hex}";
      "tab.active_background" = "${base00}${opacity-hex}";
      "tab.inactive_background" = "#00000000";
      "border" = "#00000000";
      "border.variant" = "#00000000";
      # "status_bar.background" = "${base00}${floatToHex (opacity + 0.2)}";
      "title_bar.background" = "${base00}${opacity-hex}";
      # "scrollbar.track.background" = "${base03}30";
      # "scrollbar.thumb.background" = "${base03}30";
      # "scrollbar.thumb.border" = "#00000000";
      # "elevated_surface.background" = "${base02}F3";
      "editor.active_line_number" = "${base07}${opacity-hex}";
      "editor.gutter.background" = "${base00}${opacity-hex}";
      "editor.line_number" = "${base04}${opacity-hex}";
      "editor.active_line.background" = "${base02}${opacity-hex}";
      # "surface.background" = "#00000000";
    };

    "project_panel" = {
      "entry_spacing" = "comfortable";
      "sticky_scroll" = false;
    };
  };
}
