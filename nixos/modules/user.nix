{ user, pkgs, ... }: {
  programs.fish.enable = true;
  users.users.${user} = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["wheel" "networkmanager" "wireshark"];
  };
  
  services = {
    gvfs.enable = true;
  };
}