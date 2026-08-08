{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    rofi
    inputs.waybar.packages.${pkgs.stdenv.hostPlatform.system}.default
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