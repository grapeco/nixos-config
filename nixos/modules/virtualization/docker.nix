{ user, ... }: {
  virtualisation.docker = {
    enable = true;
    storageDriver = "btrfs";
  };

  users.users.${user}.extraGroups = [ "docker" ];
}
