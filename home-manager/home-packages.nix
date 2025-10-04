{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # GUI utils
    telegram-desktop
    vesktop
    libreoffice
    pavucontrol
    audacious
    mpv
    postman
    dino
    qbittorrent
    obs-studio
    lutris
    mangohud
    chromium
    nautilus
    eog

    inputs.prismlauncher.packages.${system}.default

    # CLI Utils
    wget
    cmatrix
    fastfetch
    wireguard-tools
    btop
    unzip
    nix-prefetch-scripts
    speedtest-cli
    lunarvim
    yt-dlp
    umu-launcher
    wine
    rustc
    cargo
    jdk
    appimage-run
    nftables
    nixd
    clang
    clang-tools

    # Hyprland stuff
    wofi
    wl-clipboard
    cliphist
    kdePackages.xwaylandvideobridge
    libnotify
    hyprpicker
    grimblast

    # idk
    papirus-icon-theme
    pcmanfm-qt
    corefonts
  ];
}
