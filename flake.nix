{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };

    waybar = {
      url = "github:Alexays/Waybar";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    minegrub-theme = {
      url = "github:Lxtharia/minegrub-theme";
    };

    prismlauncher = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
    };

    catppuccin-cava = {
      url = "github:catppuccin/cava";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      homeStateVersion = "24.11";
      user = "nox";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs user homeStateVersion; };
        modules = [
          ./nixos/configuration.nix

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              users.${user} = ./home-manager/home.nix;
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit inputs homeStateVersion user;
              };
            };
          }
        ];
      };
    };
}
