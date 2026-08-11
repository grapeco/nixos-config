{ pkgs, ... }:
with pkgs;
let
  pname = "helium-browser";
  version = "0.15.3.1";

  architectures = {
    "x86_64-linux" = {
      arch = "x86_64";
      hash = "sha256-ZCCm/prkgYgbDHW6OBPWvoIE77g7IYQpYdqc/PnIrSU=";
    };
    "aarch64-linux" = {
      arch = "arm64";
      hash = "sha256-KfQlOT4mMKQ40B8hWl+GlmRNVhZnEln59ptfXN0XCLc=";
    };
  };

  src =
    let
      inherit (architectures.${stdenv.hostPlatform.system}) arch hash;
    in
    fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-${arch}.AppImage";
      inherit hash;
    };
in
appimageTools.wrapType2 (finalAttrs: {
  inherit pname version src;

  appimageContents = appimageTools.extractType2 { inherit pname version src; };

  extraInstallCommands = ''
    mkdir -p $out/share/applications
    mkdir -p $out/share/icons/hicolor/512x512/apps/
    cp -r ${finalAttrs.appimageContents}/helium.desktop -t $out/share/applications/
    cp -r ${finalAttrs.appimageContents}/helium.png -t $out/share/icons/hicolor/512x512/apps/

    mv $out/bin/helium-browser $out/bin/helium
  '';

  meta = {
    platforms = lib.attrNames architectures;
  };
})
