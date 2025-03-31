{ pkgs, ... }: {
  
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      rust-lang.rust-analyzer
      bbenoist.nix
      catppuccin.catppuccin-vsc-icons
      github.copilot
      github.copilot-chat
      # harg.iceberg(imperative)
    ];
    userSettings = {
      "chat.editor.fontFamily" = "JetBrains Mono";
      "chat.editor.fontSize" = 17.333333333333332;
      "debug.console.fontFamily" = "JetBrains Mono";
      "debug.console.fontSize" = 17.333333333333332;
      "editor.fontFamily" = "JetBrains Mono";
      "editor.fontSize" = 17.333333333333332;
      "editor.inlayHints.fontFamily" = "JetBrains Mono";
      "editor.inlineSuggest.fontFamily" = "JetBrains Mono";
      "editor.minimap.sectionHeaderFontSize" = 11.142857142857142;
      "markdown.preview.fontFamily" = "Noto Sans";
      "markdown.preview.fontSize" = 17.333333333333332;
      "scm.inputFontFamily" = "JetBrains Mono";
      "scm.inputFontSize" = 16.095238095238095;
      "screencastMode.fontSize" = 69.33333333333333;
      "terminal.integrated.fontSize" = 17.333333333333332;
      "workbench.colorTheme" = "Stylix";
      "workbench.iconTheme" = "catppuccin-mocha";
      "files.autoSave" = "afterDelay";
    };
  };
}
