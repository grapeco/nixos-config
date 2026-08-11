{ pkgs, inputs, stable, ... }: 
{  
  # imports = [
  #   ./custom/anydesk/module.nix
  # ];

  # services.anydesk.enable = true;
  
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
    inputs.muscat.packages.${pkgs.stdenv.hostPlatform.system}.default
    
    # Browsing
    firefox
    chromium
    (callPackage ./custom/helium/package.nix {})
    
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
    (callPackage ./custom/hiddify/package.nix {})
    qbittorrent
    obs-studio
    nautilus
    eog
    blueman
  ];
}