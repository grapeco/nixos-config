{ pkgs, inputs, ... }: {
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
    hyprpolkitagent
  ];

  security.polkit.enablePkexecWrapper = true;
}