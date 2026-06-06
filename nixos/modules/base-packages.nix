{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    neovim
    home-manager
    git
  ];
}