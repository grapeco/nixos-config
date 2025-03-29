{ pkgs, ... }: {
  
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      bbenoist.nix
      catppuccin.catppuccin-vsc-icons
      github.copilot
      github.copilot-chat
    ];
  };
}
