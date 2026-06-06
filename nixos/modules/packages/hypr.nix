{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
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
  ];
}