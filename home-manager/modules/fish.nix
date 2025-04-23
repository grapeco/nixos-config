{ config, ... }: {
  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      starship init fish | source

      alias rebuild='sudo nixos-rebuild switch --flake ./'
      alias garbage='sudo nix-collect-garbage -d'
      alias update='sudo nix flake update'
    '';
  };
}
