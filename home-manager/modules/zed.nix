{ pkgs, lib, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];

    userSettings = {
      hour_format = "hour24";
      auto_update = false;

      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [".env" "env" ".venv" "venv"];
            activate_script = "default";
          };
        };

        env = {
          TERM = "kitty";
        };

        toolbar = {
          title = true;
        };

        working_directory = "current_project_directory";
      };

      lsp = {
        rust-analyzer = {
          binary.path_lookup = true;
        };
        nix = {
          binary.path_lookup = true;
        };
      };
    };
  };
}