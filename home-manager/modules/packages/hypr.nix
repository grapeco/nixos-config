{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi
    waybar
    hyprlock
    wl-clipboard
    cliphist
    libnotify
    hyprpicker
    grimblast
    swaynotificationcenter
    
    adw-gtk3
    bibata-cursors
  ];
}