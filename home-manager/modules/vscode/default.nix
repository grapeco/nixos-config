{ pkgs, ... }: 
{
  imports = [
    # ./extensions.nix
  ];
  
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      enableUpdateCheck = false; 
      enableExtensionUpdateCheck = false; 
      extensions = with pkgs.vscode-marketplace; [
        rust-lang.rust-analyzer
        jnoortheen.nix-ide

        catppuccin.catppuccin-vsc-icons
        miguelsolorio.symbols
        tamasfe.even-better-toml
        
        github.copilot
        github.copilot-chat
      ];
      userSettings = {
        "window.titleBarStyle" = "custom";
        "files.autoSave" = "afterDelay";
        "workbench.iconTheme" = "symbols";

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
  };
}
