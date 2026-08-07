{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
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