{ user, ... }: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      PubkeyAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  users.users.${user}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAteV/2wcOQgkWvFBvJp+RV6Bgh54i72X/FwkAmvbRQP u0_a467@localhost"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINOAXeUciyNy3J7eQi/VAQ3rrcmFaVakHI2vzuAIOF2J obama@DESKTOP-461R3O8"
  ];
}
