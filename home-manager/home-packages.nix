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