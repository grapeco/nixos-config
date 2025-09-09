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
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIaWqLGysB0u20RDjUD0iTrbRFNUej2x5Jb6f58l1muS u0_a421@localhost"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHA/Vi1wLHNEPExl4B2t2j59tO4EHirxs88yrjyo3NOn neverny@DESKTOP-A7BP46G"
  ];
}
