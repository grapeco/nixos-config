{ config, ... }:

with config.lib.stylix.colors.withHashtag;
{
  programs.starship = {
    enable = true;
    settings = {
      directory = {
        format = "[ ](bold ${base0D})[ $path ]($style)";
        style = "bold ${base0D}";
      };

      character = {
        success_symbol = "[ ](bold ${base0D})[ ➜](bold green)";
        error_symbol = "[ ](bold ${base0D})[ ➜](bold red)";
      };

      cmd_duration = {
        format = "[󰔛 $duration]($style)";
        style = "bg:none fg:${base0A}";
        show_notifications = false;
        min_time_to_notify = 60000;
      };
    };
  };
}
