{ user, ... }: 
{
  programs.nh = {
    enable = true;
  };

  environment.variables = {
    FLAKE = "$HOME/nixos-config";
  };
}