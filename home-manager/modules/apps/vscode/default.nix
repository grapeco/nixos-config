{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = pkgs.nix4vscode.forVscode [
        "rust-lang.rust-analyzer"
        "jnoortheen.nix-ide"
        "llvm-vs-code-extensions.vscode-clangd"
        "13xforever.language-x86-64-assembly"
        "mkhl.direnv"

        "yzane.markdown-pdf"
        "fill-labs.dependi"
        "miguelsolorio.symbols"
        "catppuccin.catppuccin-vsc-icons"
        "tamasfe.even-better-toml"
        "usernamehw.errorlens"
        "formulahendry.code-runner"
      ];
      userSettings = {
        "window.titleBarStyle" = "custom";
        "files.autoSave" = "afterDelay";
        "workbench.iconTheme" = "catppuccin-mocha";

        "markdown-pdf.executablePath" = "${pkgs.chromium}/bin/chromium";

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
