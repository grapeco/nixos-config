{ user, ... }: {
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PubkeyAuthentication = true;
      PermitRootLogin = "no";
    };
  };

  users.users.${user}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKW/uqgpxCMInbRo2HwuGoO20EP36C/8BSrDodISXgZW u0_a290@localhost"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGbURY3lAc0GDNw9YEnbyYjtQAapEPZ666kTjkxNk1EM nox@laptop"
  ];
}
