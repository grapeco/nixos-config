{ pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    # Games
    lutris
    mangohud
    inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
    
    # Studying
    libreoffice
    postman
    dbeaver-bin
    qalculate-qt
    gimp
    zed-editor
    
    # Other
    alacritty
    chromium
    telegram-desktop
    pavucontrol
    mpv   
    qbittorrent
    obs-studio
    nautilus
    eog
    fluffychat
    gnome-text-editor
    blueman
    vesktop   
  ];
}