{ ... }: {
  programs.zed-editor = {
    # enable = true;
    userSettings = {
      auto-update = false;
      autosave.after_delay.milliseconds = 500;

      vim_mode = false;

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      lsp = {
        rust-analyzer = {
          binary = {
            path = "/run/current-system/sw/bin/bash";
            arguments = [
              "-c"
              "if [ -e flake.nix ]; then nix develop --command rust-analyzer; else rust-analyzer; fi"
            ];
            initialization_options = {
              check = {
                command = "clippy";
              };
            };
          };
        };

        nixd = {
          binary = {
            path_lookup = true;
          };
        };
      };

      languages = {
        Nix = {
          "language_servers" = [ "nixd" "!nil" ];
        };
      };
    };
  };
}
