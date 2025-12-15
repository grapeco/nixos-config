{ ... }: {
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

  # programs.zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   autosuggestion.enable = true;
  #   syntaxHighlighting.enable = true;

  #   oh-my-zsh = {
  #     enable = true;
  #     plugins = [ "git" ];
  #   };

  #   shellAliases = {
  #     rebuild = "sudo nixos-rebuild switch --flake ./";
  #     garbage = "sudo nix-collect-garbage -d";
  #     update = "sudo nix flake update";
  #   };
  # };
}
