{
  rustPlatform,
  fetchFromGitHub,
  rustc,
  cargo,
  gtk3,
  glib,
  pkg-config,
  wrapGAppsHook3,
  ...
}:

rustPlatform.buildRustPackage rec {
  name = "muscat";
  src = fetchFromGitHub {
    owner = "grapeco";
    repo = "muscat";
    rev = "master";
    hash = "sha256-ht+DJmlA2XLbsL4dML4/YvZKUF615kCVs6g4KC3Pmhg=";
  };
  
  nativeBuildInputs = [
    rustc
    cargo
    pkg-config
    wrapGAppsHook3
  ];
  
  buildInputs = [
    gtk3
    glib
  ];
  
  cargoLock.lockFile = "${src}/Cargo.lock";
}