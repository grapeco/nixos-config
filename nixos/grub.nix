{ pkgs, inputs, ... }: {
  imports = [ inputs.minegrub-theme.nixosModules.default ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      minegrub-theme = {
        enable = true;
        splash = "100% Flakes!";
        background = "background_options/1.18 - [Caves And Cliffs 2].png";
      };
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };
}