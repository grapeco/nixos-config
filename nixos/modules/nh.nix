{ user, ... }: 
{
  programs.nh = {
    enable = true;
    # clean.enable = true;
    flake = "/home/${user}/nixos-config";
  };
}