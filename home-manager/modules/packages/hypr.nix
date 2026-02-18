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
    brightnessctl
    
    adw-gtk3
  ];
}