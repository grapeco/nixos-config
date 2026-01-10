{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # GUI apps
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

    inputs.prismlauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.awww.packages.${pkgs.stdenv.hostPlatform.system}.awww
    
    # CLI Utils
    wget
    cmatrix
    fastfetch
    wireguard-tools
    btop
    unzip
    nix-prefetch-scripts
    lunarvim
    yt-dlp
    umu-launcher
    rustc
    cargo
    jdk
    appimage-run
    nftables
    nixd
    clang
    clang-tools
    nasm
    vim
    home-manager
    stow
    steamcmd
    
    rofi
    hyprlock
    wl-clipboard
    cliphist
    libnotify
    hyprpicker
    grimblast
  ];
}