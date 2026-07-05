{ pkgs, inputs, stable, ... }: 
{  
  environment.systemPackages = with pkgs; [
    # Games
    # stable.lutris
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
    obsidian
    inputs.muscat.packages.${pkgs.stdenv.hostPlatform.system}.default
    
    # Browsing
    firefox
    chromium
    
    # Communication
    element-desktop
    fluffychat
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
    blueman
  ];
}