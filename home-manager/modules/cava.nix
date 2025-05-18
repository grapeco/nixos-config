{ inputs, ... }: 
{
  programs.cava = {
    enable = true;
  };

  home.file.".config/cava/config".text = ''
    # custom cava config
  '' + builtins.readFile "${inputs.catppuccin-cava}/themes/mocha.cava";
}