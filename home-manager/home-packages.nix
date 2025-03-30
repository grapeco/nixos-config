{ pkgs, ... }: {
  
  home.packages = with pkgs; [
    vim
    cmatrix
    wget
    fastfetch
    firefox
    wireguard-tools
    telegram-desktop
    vesktop
    neovim
    cava
    libreoffice-qt6-fresh
    btop

    wofi
    waybar
    wl-clipboard
    libsForQt5.xwaylandvideobridge
    libnotify
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    gnome-extension-manager
    gnomeExtensions.dash-to-dock
    gnomeExtensions.burn-my-windows
    gnomeExtensions.appindicator
    gnomeExtensions.blur-my-shell
  ];
}