{ inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.overlays = [ 
    inputs.nix4vscode.overlays.forVscode 

    # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/development/python-modules/nanoemoji/default.nix
    (final: prev: {
      python313Packages = prev.python313Packages.overrideScope (pyFinal: pyPrev: {
        nanoemoji = pyPrev.nanoemoji.overrideAttrs (old: {
          src = old.src.overrideAttrs (_: {
            hash = "sha256-FysyKC01XBnRiur5RR9fcsTxQqE8x0JJHSoe3q6JtKc=";
          });
        });
      });
    })
  ];

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nix.settings = {
    auto-optimise-store = true;
    builders-use-substitutes = true;

    substituters = [
      "https://cache.nixos.org"
      "https://hyprland.cachix.org"
      "https://nix-community.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
