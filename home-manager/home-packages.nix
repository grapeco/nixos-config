{ pkgs, ... }: {
  
  home.packages = with pkgs; [
    # Gui utils
    firefox
    telegram-desktop
    vesktop
    libreoffice-qt6-fresh

    # CLI Utils
    wget
    cmatrix
    fastfetch
    wireguard-tools
    neovim
    cava
    btop
    unzip
    nix-prefetch-scripts
    speedtest-cli

    # Hyprland stuff
    wofi
    waybar
    wl-clipboard
    cliphist
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
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