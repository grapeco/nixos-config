{ config, ... }: {
  
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      alias rebuild='sudo nixos-rebuild switch --flake ~/nixos-config'
      alias garbage='sudo nix-collect-garbage -d'
    '';
  };
}
