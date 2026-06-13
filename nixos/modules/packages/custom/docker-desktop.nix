{ pkgs ? import <nixpkgs> {} }:

let
  dependencies = with pkgs; [
    docker
    qemu
    gtk3
    libGL
    pass
    curl
    zlib
    glib
    nspr
    nss
    dbus.lib
    udev
    atk
    cups
    cairo
    pango
    libx11
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxrandr
    libxcb
    libxkbcommon
    libgbm
    expat
    alsa-lib
  ];
  
  docker-desktop = pkgs.stdenv.mkDerivation {
    pname = "docker-desktop";
    version = "4.73.0";

    src = ./docker-desktop-amd64.deb;

    nativeBuildInputs = with pkgs; [ 
      dpkg 
      makeWrapper 
    ];
    
    buildInputs = dependencies;

    unpackPhase = ''
      dpkg-deb -x $src .
    '';

    installPhase = ''
      mkdir -p $out
      
      cp -r opt $out
      cp -r usr $out
      
      substituteInPlace $out/usr/lib/systemd/user/docker-desktop.service \
        --replace-fail /opt/docker-desktop/bin/com.docker.backend $out/opt/docker-desktop/bin/com.docker.backend
        
      mkdir -p $out/share/systemd/user
      cp $out/usr/lib/systemd/user/docker-desktop.service $out/share/systemd/user
    '';
  };
in
  docker-desktop
# pkgs.buildFHSEnv {
#   name = "docker-desktop-fhs";

#   targetPkgs = pkgs: dependencies;

#   extraBuildCommands = ''
#     cp -r ${docker-desktop}/opt/* $out/opt
#     cp -r ${docker-desktop}/usr/bin/* $out/usr/bin
#     cp -r ${docker-desktop}/usr/lib/* $out/usr/lib64 
#     cp -r ${docker-desktop}/usr/share/* $out/usr/share
#   '';
  
#   runScript = ''
#     bash
#   '';
# }