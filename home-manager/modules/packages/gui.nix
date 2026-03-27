{ pkgs, inputs, ... }: {  
  home.packages = with pkgs; [
    # Games
    lutris
    mangohud
    inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
    mindustry
    
    # Studying
    libreoffice
    onlyoffice-desktopeditors
    postman
    dbeaver-bin
    qalculate-qt
    gimp
    zed-editor
    ghidra
    
    # Browsing
    firefox
    chromium
    
    # Communication
    element-desktop
    telegram-desktop
    vesktop
    
    # Other
    alacritty
    pavucontrol
    mpv   
    qbittorrent
    obs-studio
    nautilus
    eog
    gnome-text-editor
    blueman
  ];
}