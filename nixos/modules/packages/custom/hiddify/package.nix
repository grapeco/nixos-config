{ pkgs, ... }:

with pkgs;
let
  version = "4.1.1";
in
stdenv.mkDerivation (finalAttrs: {
  name = "hiddify";
  
  src = fetchurl {
    url = "https://github.com/hiddify/hiddify-app/releases/download/v${version}/Hiddify-Debian-x64.deb";
    hash = "sha256-5iKr0V99RBDFZV8/3ND6kwCURmb6QKwidh8G+TAg8Q4=";
  };

  nativeBuildInputs = [
    dpkg
    makeWrapper
    autoPatchelfHook
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    curl
    libayatana-appindicator
  ];

  unpackPhase = ''
    dpkg-deb -x $src .
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share
    cp -r usr/share/* $out/share/

    ln -s $out/share/hiddify/hiddify $out/bin/hiddify
    ln -s $out/share/hiddify/HiddifyCli $out/bin/HiddifyCli
    
    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/hiddify \
      --prefix LD_LIBRARY_PATH : $out/share/hiddify/lib \
      --set GTK_THEME "Adwaita:dark"

    wrapProgram $out/bin/HiddifyCli \
      --prefix LD_LIBRARY_PATH : $out/share/hiddify/lib
  '';
})