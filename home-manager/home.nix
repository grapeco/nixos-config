{ homeStateVersion, user, ... }: {

  imports = [
    ./home-packages.nix
    ./modules/default.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}