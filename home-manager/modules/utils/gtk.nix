{ pkgs, ... }: {  
  home.packages = with pkgs; [
    adw-gtk3
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adw-gtk3-dark";
      color-scheme = "prefer-dark";
      icon-theme = "Papirus-Dark";
      font-name = "Adwaita Sans 11";
    };
  };
  
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
    };
  };
}