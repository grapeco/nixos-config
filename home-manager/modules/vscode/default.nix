{ pkgs, ... }:
{
  home.packages = with pkgs; [
    direnv
  ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = false;
      extensions = pkgs.nix4vscode.forVscode [
        "rust-lang.rust-analyzer"
        "jnoortheen.nix-ide"
        "llvm-vs-code-extensions.vscode-clangd"
        "13xforever.language-x86-64-assembly"

        "yzane.markdown-pdf"
        "fill-labs.dependi"
        "miguelsolorio.symbols"
        "tamasfe.even-better-toml"
        "usernamehw.errorlens"
        "formulahendry.code-runner"
        "postman.postman-for-vscode"
        "mkhl.direnv"
      ];
      userSettings = {
        "window.titleBarStyle" = "custom";
        "files.autoSave" = "afterDelay";
        "workbench.iconTheme" = "symbols";

        "editor.insertSpaces" = true;
        "editor.detectIndentation" = true;
        "editor.renderControlCharacters" = true;
        "editor.minimap.enabled" = false;

        "nix.serverPath" = "nixd";
        "nix.enableLanguageServer" = true;
        "code-runner.executorMap" = {
          "c" = "cd $dir && clang $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
          "cpp" = "cd $dir && clang++ $fileName -o $fileNameWithoutExt && $dir$fileNameWithoutExt";
        };
      };
    };
  };
}
