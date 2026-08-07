{ pkgs, ... }:

with pkgs;
let
  description = "Desktop sharing application, providing remote support and online meetings";
  pin = lib.importJSON ./pin.json;
    inherit (pin) version;
    inherit (stdenv.hostPlatform) system;
  url = 
    if system == "x86_64-linux" then
      "https://download.anydesk.com/linux/anydesk-${version}-amd64.tar.gz"
    else if system == "aarch64-linux" then
      "https://download.anydesk.com/rpi/anydesk-${version}-arm64.tar.gz"
    else
      throw "cannot install AnyDesk on ${system}";
  hash = pin.${system};
in
stdenv.mkDerivation (finalAttrs: {
  pname = "anydesk";
  inherit version;
  
  src = fetchurl {
    inherit url hash;
  };

  nativeBuildInputs = [
    copyDesktopItems
    makeWrapper
    autoPatchelfHook
    wrapGAppsHook3
  ];

  buildInputs = [
    glib
    gtk3
    gdk-pixbuf
    pango
    cairo
    atk
    libx11
    libxcb
    polkit
    libxrender
    libxi
    libxrandr
    libxtst
    libxext
    libxfixes
    libxdamage
    libxkbfile
    wayland
    libepoxy
    udev
    fontconfig
    freetype
    libz
    dbus
    libgcc
  ];

  desktopItems = [
    (pkgs.makeDesktopItem {
      name = "AnyDesk";
      exec = "anydesk %u";
      icon = "anydesk";
      desktopName = "AnyDesk";
      genericName = description;
      categories = [ "Network" ];
      startupNotify = false;
    })
  ];

  postPatch = ''
    substituteInPlace systemd/anydesk.service \
      --replace-fail "/usr/bin/anydesk" "$out/bin/anydesk"
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/{applications,doc/anydesk,icons/hicolor} $out/lib/systemd/system
    install -m755 anydesk $out/bin/anydesk
    cp copyright README $out/share/doc/anydesk
    cp -r icons/hicolor/* $out/share/icons/hicolor
    cp systemd/anydesk.service $out/lib/systemd/system/anydesk.service
    
    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/anydesk \
      --prefix PATH : ${lib.makeBinPath [ lsb-release pciutils net-tools ]} \
  '';
})