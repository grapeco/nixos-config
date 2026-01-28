{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wget
    vim
    home-manager
    git
  ];
}