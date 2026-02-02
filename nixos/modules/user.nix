{ user, ... }: {
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager" "wireshark"];
  };
  
  services = {
    gvfs.enable = true;
  };
}