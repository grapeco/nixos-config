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
    dbeaver-bin
    qbittorrent
    obs-studio
    lutris
    mangohud
    chromium
    nautilus
    eog
    fluffychat
    qalculate-qt
    gimp
    krita
    wireshark

    inputs.prismlauncher.packages.${system}.default
    inputs.swww.packages.${pkgs.system}.swww

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
    rust-analyzer
    jdk
    appimage-run
    nftables
    aircrack-ng
    nixd
    clang
    clang-tools
    nasm
    gdb

    # Hyprland stuff
    wofi
    wl-clipboard
    cliphist
    libnotify
    hyprpicker
    grimblast

    # idk
    papirus-icon-theme
    pcmanfm-qt
    corefonts
  ];
}
