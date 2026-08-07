{ pkgs, inputs, stable, ... }: 
{  
  # systemd.packages = with pkgs; [
  #   (callPackage ./custom/anydesk { })
  # ];
  # systemd.services.anydesk.wantedBy = [ "multi-user.target" ];
  
  environment.systemPackages = with pkgs; [
    # Games
    # stable.lutris
    mangohud
    inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
    stable.mindustry
    
    # Studying
    libreoffice
    onlyoffice-desktopeditors
    postman
    dbeaver-bin
    qalculate-qt
    gimp
    zed-editor
    obsidian
    (callPackage ./custom/anydesk/package.nix { })
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
    amberol
    pavucontrol
    mpv   
    qbittorrent
    obs-studio
    nautilus
    eog
    blueman
  ];
}