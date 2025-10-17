{ user, ... }: {
  services.openssh = {
    enable = true;
    ports = [ 222 ];
    settings = {
      PasswordAuthentication = false;
      PubkeyAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  users.users.${user}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAteV/2wcOQgkWvFBvJp+RV6Bgh54i72X/FwkAmvbRQP u0_a467@localhost"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKzAWJmvahvgg3b9tNsbT8Y0rt/4Z2AyzfRCSomHv3CK buravchik@DESKTOP-GS611P3"
  ];
}
