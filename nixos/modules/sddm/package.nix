{ pkgs, ... }:

with pkgs;
stdenv.mkDerivation (finalAttrs: {
  name = "pixel-night-city";
  
  src = ./pixel-night-city;

  installPhase = ''
    mkdir -p $out/share/sddm/themes/${finalAttrs.name}
    cp -r . $out/share/sddm/themes/${finalAttrs.name}
  '';
})