{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    # GUI utils
    firefox
    telegram-desktop
    vesktop
    libreoffice
    pavucontrol
    audacious
    mpv
    dbeaver-bin
    postman
    dino
    qbittorrent
    obs-studio
    lutris
    mangohud

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
    unrar
    yt-dlp
    umu-launcher
    wine
    rust-analyzer
    rustc
    cargo
    usbutils
    jdk
    appimage-run
    gcc
    nftables
    nixd
    alejandra

    # Hyprland stuff
    wofi
    wl-clipboard
    cliphist
    libsForQt5.xwaylandvideobridge
    libnotify
    hyprpicker
    grimblast

    # Gnome stuff
    gnome-extension-manager
    gnomeExtensions.dash-to-dock
    gnomeExtensions.burn-my-windows
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-history

    # idk
    papirus-icon-theme
    pcmanfm-qt
  ];
}
