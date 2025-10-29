{ inputs, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    package = inputs.waybar.packages.${pkgs.system}.waybar;
    style = ./style.css;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 30;

      modules-left = [ "hyprland/workspaces" "custom/cava" ];
      modules-center = [ "custom/gpu" "cpu" "memory" ];
      modules-right = [ "hyprland/language" "custom/weather" "network" "pulseaudio" "battery" "clock" "tray" ];

      "hyprland/workspaces" = {
        disable-scroll = true;
        show-special = true;
        all-outputs = false;
        format = "{}";
        persistent-workspaces = {
          "*" = 9;
        };
      };

      "custom/cava" = {
        # framerate = 30;
        # bars = 12;
        # bar_delimiter = 0;
        # autosens = 1;
        # source = "auto";
        # format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];

        format = "{}";
        exec = ./cava.sh;
      };

      "custom/gpu" = {
        format = "{}% ";
        interval = 2;
        exec = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{print $1}'";
        tooltip = false;
      };

      "cpu" = {
        interval = 2;
        format = "{usage}% ";
      };

      "memory" = {
        format = "{used:0.1f}GB ";
        tooltip = true;
        tooltip-format = "Memory Used: {used:0.1f} GB / {total:0.1f} GB \nSwap Used: {swapUsed:0.1f} GB / {swapTotal:0.1f} GB";
        interval = 5;
      };

      "hyprland/language" = {
        format-en = "🇺🇸";
        format-ru = "🇷🇺";
      };

      "network" = {
        format-wifi = "";
        format-ethernet = "";
        format-linked = "{ifname} (No IP) ";
        format-disconnected = "";
        family = "ipv4";
        tooltip-format-wifi = " {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\n {bandwidthUpBits}  {bandwidthDownBits}";
        tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n {bandwidthUpBits}  {bandwidthDownBits}";
        interval = 1;
      };

      "pulseaudio" = {
        format = "{icon} {volume}%";
        format-bluetooth = "{icon} {volume}% ";
        format-muted = "󰝟";
        format-icons = {
          "headphones" = "";
          "handsfree" = "";
          "headset" = "";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = ["󰕿" "󰖀" "󰕾"];
        };
        on-click = "pavucontrol";
      };

      "battery" = {
        states = {
          warning = 30;
          critical = 1;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-alt = "{time} {icon}";
        format-icons = ["" "" "" "" ""];
      };

      "clock" = {
        format = "{:%H:%M}";
        tooltip-format = "<tt>{calendar}</tt>";
        calendar = {
          mode = "month";
          format = {
            today = "<span color='#f38ba8'><b>{}</b></span>";
            months = "<span color='#89B4FA'><b>{}</b></span>";
            weekdays = "<span color='#CBA6F7'><b>{}</b></span>";
          };
        };
      };

      "tray" = {
        icon-size = 16;
        spacing = 6;
      };
    };
  };
}
