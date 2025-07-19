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
    vlc
    dbeaver-bin
    postman
    dino
    qbittorrent
    inkscape
    obs-studio
    tigervnc

    inputs.prismlauncher.packages.${system}.default

    # CLI Utils
    wget
    cmatrix
    fastfetch
    wireguard-tools
    neovim
    btop
    unzip
    nix-prefetch-scripts
    speedtest-cli
    lunarvim
    unrar
    yt-dlp
    umu-launcher

    # Hyprland stuff
    wofi
    waybar
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
