{ pkgs, lib, ... }: 
{
  programs.zed-editor = {
    enable = true;
    
    userSettings = {
      auto-update = false;
      vim_mode = true;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      ui_font_size = lib.mkForce 16;
      buffer_font_size = lib.mkForce 16;

      "lsp" = {
        "rust-analyzer" = {
          "binary" = {
            "path" = "/run/current-system/sw/bin/bash";
            # "path_lookup" = true;
            "arguments" = [
              "-c"
              "if [ -e flake.nix ]; then nix develop --command rust-analyzer; else rust-analyzer; fi"
            ];
            "initialization_options" = {
              "check" = {
                "command" = "clippy";
              };
            };
          };
        };
      };

      "assistant" = {
        "default_model" = {
          "provider" = "ollama";
          "model" = "deepseek-r1:7b";
        };
        "version" = "2";
      };
    };
  };
}