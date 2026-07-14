{ 
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      # inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # stylix = {
    #   url = "github:danth/stylix";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # zapret = {
    #   # url = "github:kartavkun/zapret-discord-youtube";
    #   url = "git+https://git.roodnt.name/Roodnt/zapret-discord-youtube";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    spicetify-nix = {
      url = "github:gerg-l/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nix-alien = {
      url = "github:thiagokokada/nix-alien";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix4vscode = {
      url = "github:nix-community/nix4vscode";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    minegrub-theme = {
      url = "github:Lxtharia/minegrub-theme";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    qylock = {
      url = "github:Darkkal44/qylock";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    prismlauncher = {
      url = "github:Diegiwg/PrismLauncher-Cracked";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
    
    muscat = {
      url = "github:grapeco/muscat";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    user = "nox";

    makeSystem = system: hostname: nixpkgs.lib.nixosSystem {
      inherit system;
      
      modules = [
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            users.${user} = ./home-manager/home.nix;
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {
              inherit inputs user;
            };
          };
        }
        
        ./hosts/${hostname}/configuration.nix
        ./nixos/modules
      ];

      specialArgs = {
        inherit inputs hostname user;
      };
    };
  in {
    nixosConfigurations = {
      nixos = makeSystem "x86_64-linux" "nixos";
      laptop = makeSystem "x86_64-linux" "laptop";
    };
  };
}
