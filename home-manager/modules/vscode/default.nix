{ pkgs, ... }:
{
  home.packages = with pkgs; [
    direnv
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      extensions = with pkgs.vscode-marketplace; [
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        ms-vscode.cpptools-extension-pack

        catppuccin.catppuccin-vsc-icons
        miguelsolorio.symbols
        tamasfe.even-better-toml
        usernamehw.errorlens
        formulahendry.code-runner
        postman.postman-for-vscode
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
