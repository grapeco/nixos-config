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
        modules-center = [ "custom/gpu" "cpu" "custom/mem" ];
        modules-right = [ "hyprland/language" "custom/weather" "network" "pulseaudio" "battery" "clock" "tray" ];

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

        "custom/mem" = {
          format = "{} ";
          interval = 3;
          exec = "free -h | awk '/Mem:/{printf $3}'";
          tooltip = false;
          min-length = 9;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 8;
        };

        "custom/gpu" = {
          format = "{}% ";
          interval = 2;
          exec = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | awk '{print $1}'";
          tooltip = false;
          min-length = 8;
        };

        "hyprland/language" = {
          format-en = "🇺🇸";
          format-ru = "🇷🇺";
          min-length = 4;
          tooltip = false;
        };

        "network" = {
          interface = "wlp0s20u2";
          interval = 2;
          format = " {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-disconnected = "";
          min-length = 24;
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

        "clock" = {
          format = "{:%d.%m.%Y - %H:%M}";
          format-alt = "{:%A, %B %d at %R}";
        };

        "tray" = {
          icon-size = 14;
          spacing = 1;
        };
      };
    };
  };
}