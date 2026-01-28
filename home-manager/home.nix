{ homeStateVersion, user, inputs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ inputs.nix4vscode.overlays.forVscode ];

  imports = [
    ./modules
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };
}
