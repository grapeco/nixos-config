{ homeStateVersion, user, pkgs, ... }: {

  imports = [
    ./home-packages.nix
    ./modules/default.nix
  ];

  home = {
    stateVersion = homeStateVersion;
  };
}