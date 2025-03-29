{ pkgs, ... }: {
  
  home.packages = with pkgs; [
    vim
    cmatrix
    wget
    fastfetch
    firefox
    wireguard-tools
    kitty
    telegram-desktop
    vesktop
    neovim
    cava
    libreoffice-qt6-fresh

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

    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}