{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    alacritty
    chromium
    telegram-desktop
    libreoffice
    pavucontrol
    audacious
    mpv   
    postman
    dbeaver-bin
    qbittorrent
    obs-studio
    lutris
    mangohud
    nautilus
    eog
    fluffychat
    qalculate-qt
    gimp
    gnome-text-editor
    blueman
    vesktop   
    kitty
    zed-editor

    inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}