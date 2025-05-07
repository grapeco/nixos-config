{ pkgs, ... }: {
  
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      jnoortheen.nix-ide
      catppuccin.catppuccin-vsc-icons
      github.copilot
      github.copilot-chat
    ];
    profiles.default.userSettings = {
      "window.titleBarStyle" = "custom";
      "files.autoSave" = "afterDelay";
      "workbench.iconTheme" = "catppuccin-mocha";

      "editor.tabSize" = 2;                   
      "editor.insertSpaces" = true;            
      "editor.detectIndentation" = true;       
      "editor.renderControlCharacters" = true;
      "editor.minimap.enabled" = false;

      "nix.serverPath" = "nixd";
      "nix.enableLanguageServer" = true;
      "formatting.command" = [ "alejandra" ];
    };
  };
}