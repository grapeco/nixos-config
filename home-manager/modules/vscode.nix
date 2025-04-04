{ pkgs, ... }: {
  
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      bbenoist.nix
      catppuccin.catppuccin-vsc-icons
      github.copilot
      github.copilot-chat
      # harg.iceberg(imperative)
    ];
    userSettings = {
      "window.titleBarStyle" = "custom";
      "files.autoSave" = "afterDelay";
      "workbench.iconTheme" = "catppuccin-mocha";

      "editor.tabSize" = 2;                   
      "editor.insertSpaces" = true;            
      "editor.detectIndentation" = true;       
      "editor.renderControlCharacters" = true;
    };
  };
}