{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        # Hint Electron apps to use Wayland
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "XDG_DATA_DIRS, $HOME/.local/share:$XDG_DATA_DIRS"
      ];

      monitor = ", 1920x1080@100, 0x0, 1";
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun";
      "$browser" = "firefox";

      exec-once = [
        "waybar"
        "awww-daemon"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
      ];

      debug = {
        disable_logs = false;
      };

      general = {
        gaps_in = 5;
        gaps_out = 0;
        border_size = 2;
        resize_on_border = true;
        layout = "dwindle";
        allow_tearing = true;
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;
      };

      animations = {
        enabled = true;

        bezier = let
          speed = 0.6;
        in [
          "linear, 0, ${toString (0 * speed)}, 1, 1"
          "md3_standard, 0.2, ${toString (0 * speed)}, 0, 1"
          "md3_decel, 0.05,  ${toString (0.7 * speed)}, 0.07, 1"
          "md3_accel, 0.3, ${toString (0 * speed)}, 0.8, 0.15"
          "overshot, 0.05, ${toString (0.9 * speed)}, 0.1, 1.1"
          "crazyshot, 0.1, ${toString (1.5 * speed)}, 0.76, 0.92"
          "menu_decel, 0.1, ${toString (1 * speed)}, 0, 1"
          "menu_accel, 0.38, ${toString (0.04 * speed)}, 1, 0.07"
          "easeInOutCirc, 0.85, ${toString (0 * speed)}, 0.15, 1"
          "easeOutCirc, 0, ${toString (0.55 * speed)}, 0.45, 1"
          "easeOutExpo, 0.16, ${toString (1 * speed)}, 0.3, 1"
          "softAcDecel, 0.26, ${toString (0.26 * speed)}, 0.15, 1"
          "md2, 0.4, ${toString (0 * speed)}, 0.2, 1"
        ];

        animation = [
          "windows, 1, 2, md3_decel, popin 60%"
          "windowsIn, 1, 2, md3_decel, popin 60%"
          "windowsOut, 1, 2, md3_accel, popin 60%"
          "border, 1, 10, default"
          "fade, 1, 2, md3_decel"
          "layersIn, 1, 2, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 2.5, menu_accel"
          "workspaces, 1, 5, menu_decel, slide"
          "specialWorkspace, 1, 2.5, md3_decel, slidevert"
        ];
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      misc = {
        vrr = 2;
        vfr = 0;
      };
    };
  };
}
