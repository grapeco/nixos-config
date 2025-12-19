{ pkgs, inputs, ... }:
{
  # nixpkgs.config.allowUnfree = true;
  # nixpkgs.overlays = [ inputs.nix4vscode.overlays.forVscode ];

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
    bottles
    mangohud
    chromium
    nautilus
    eog
    fluffychat
    qalculate-qt
    gimp
    krita
    gnome-text-editor

    inputs.prismlauncher.packages.${pkgs.system}.default
    inputs.awww.packages.${pkgs.system}.awww

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
    winetricks
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
