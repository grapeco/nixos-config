{
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "custom/gpu" "cpu" "memory" ];
        modules-right = [ "hyprland/language" "custom/weather" "network" "pulseaudio" "battery" "clock#time" "clock#date" "tray" ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          show-special = true;
          special-visible-only = true;
          all-outputs = false;
          format = "{}";
          persistent-workspaces = {
            "*" = 9;
          };
        };

        "custom/gpu" = {
          format = "{}% ";
          interval = 2;
          exec = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{print $1}'";
          tooltip = false;
          min-length = 8;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 8;
        };

        "memory" = {
          format = "{used:0.1f}GB ";
          tooltip = true;
          tooltip-format = "Memory Used: {used:0.1f} GB / {total:0.1f} GB \nSwap Used: {swapUsed:0.1f} GB / {swapTotal:0.1f} GB";
          interval = 5;
          min-length = 9;
        };

        "hyprland/language" = {
          format-en = "🇺🇸";
          format-ru = "🇷🇺";
          min-length = 3;
          tooltip = false;
        };

        "network" = {
          format-wifi = "";
          format-ethernet = "";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "";
          family = "ipv4";
          tooltip-format-wifi = "  {ifname} @ {essid}\nIP: {ipaddr}\nStrength: {signalStrength}%\nFreq: {frequency}MHz\n {bandwidthUpBits}  {bandwidthDownBits}";
          tooltip-format-ethernet = " {ifname}\nIP: {ipaddr}\n {bandwidthUpBits}  {bandwidthDownBits}";
          interval = 1;
          min-length = 3;
        };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} {volume}% ";
          format-muted = "";
          format-icons = {
            "headphones" = "";
            "handsfree" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
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

        "clock#time" = {
          format = " {:%H:%M}";
          tooltip = true;
          tooltip-format = "12-hour Format: {:%I:%M %p}";
        };

        "clock#date" = {
          format = "󰨳 {:%d-%m}";
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
          icon-size = 14;
          spacing = 1;
        };
      };
    };
  };
}
