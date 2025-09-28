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
      extensions = with pkgs.vscode-marketplace; [
        rust-lang.rust-analyzer
        jnoortheen.nix-ide
        yzane.markdown-pdf
        llvm-vs-code-extensions.vscode-clangd
        fill-labs.dependi

        miguelsolorio.symbols
        tamasfe.even-better-toml
        usernamehw.errorlens
        formulahendry.code-runner
        postman.postman-for-vscode
        mkhl.direnv
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
