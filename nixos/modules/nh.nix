{ user, ... }: 
{
  programs.nh = {
    enable = true;
    clean.enable = true;
  };

  environment.variables = {
    FLAKE = "$HOME/nixos-config";
  };
}