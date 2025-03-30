{ user, ... }: {
  programs.wlogout = {
    enable = true; 
    layout = [
      {
        label = "lock";
        text = "Lock";
        action = "hyprlock";
        keybind = "l";
      }

      {
        label = "hibernate";
        text = "Hibernate";
        action = "systemctl hibernate";
        keybind = "h";
      }

      {
        label = "reboot";
        text = "Reboot";
        action = "systemctl reboot";
        keybind = "r";
      }

      {
        label = "logout";
        text = "Logout";
        action = "hyprctl dispatch exit";
        keybind = "q";
      }

      {
        label = "shutdown";
        text = "Shutdown";
        action = "systemctl poweroff";
        keybind = "s";
      }
    ];
  };
}