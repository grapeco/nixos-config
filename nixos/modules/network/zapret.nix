{ inputs, ... }: {
  imports = [
    inputs.zapret.nixosModules.default
  ];

  services.zapret-discord-youtube = {
    enable = true;
    config = "general (FAKE_TLS_AUTO)";
  };
}
