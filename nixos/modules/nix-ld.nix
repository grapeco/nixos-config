{ pkgs, ... }: 
{
  nixpkgs.overlays = [
    (final: prev: {
      webkitgtk_4_0 = (import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/25.05.tar.gz";
        sha256 = "1915r28xc4znrh2vf4rrjnxldw2imysz819gzhk9qlrkqanmfsxd";
      }) { system = prev.system; }).webkitgtk_4_0;
    })
  ];
  
  nixpkgs.config.permittedInsecurePackages = [
    "libsoup-2.74.3"
  ];
  
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Базовые системные
      stdenv.cc.cc.lib
      openssl
      glibc
      
      # X11 библиотеки
      libx11
      libxcomposite
      libxtst
      libxrandr
      libxext
      libxfixes
      libxcb
      libxdamage
      libxshmfence
      libxxf86vm
      libxinerama
      libxcursor
      libxrender
      libxscrnsaver
      libxi
      libsm
      libice
      libxt
      libxmu
      libxft
      
      # Графика
      libGL
      libGLU
      mesa
      libdrm
      libva
      # webkitgtk_4_0
      libsoup_2_4
      libelf
      libvdpau
      
      # GTK/GNOME
      glib
      gtk2
      gtk3
      gnome2.GConf
      pango
      cairo
      atk
      gdk-pixbuf
      librsvg
      libappindicator-gtk2
      libdbusmenu-gtk2
      libindicator-gtk2
      
      # Аудио
      pipewire
      alsa-lib
      libpulseaudio
      flac
      libsamplerate
      libmikmod
      libvorbis
      libogg
      speex
      libcaca
      libcanberra
      
      # Системные библиотеки
      bzip2
      nspr
      nss
      cups
      libcap
      dbus-glib
      dbus
      fontconfig
      freetype
      expat
      libgcrypt
      libidn
      tbb
      libusb1
      libudev0-shim
      
      # SDL и игры
      SDL
      SDL2
      SDL2_image
      SDL_ttf
      SDL_mixer
      SDL2_mixer
      SDL2_ttf
      SDL_image
      glew_1_10
      freeglut
      
      # Мультимедиа
      ffmpeg
      libjpeg
      libpng
      libpng12
      libtheora
      libtiff
      libvpx
      pixman
      
      # Electron/другое
      libxkbcommon
      libdrm
      libsciter
    ];
  };
}