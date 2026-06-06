{ config, pkgs, ... }: {
  hardware.graphics = {
<<<<<<< HEAD:nixos/modules/graphics/nvidia.nix
    enable = true;
    enable32Bit = true;
=======
>>>>>>> no-hm:hosts/nixos/modules/nvidia.nix
    extraPackages = [ pkgs.nvidia-vaapi-driver ];
  };

  boot.kernelModules = [
    "nvidia"
    "nvidia_modeset"
    "nvidia_uvm"
    "nvidia_drm"
  ];

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = false;
<<<<<<< HEAD:nixos/modules/graphics/nvidia.nix
    package = config.boot.kernelPackages.nvidiaPackages.latest;
=======
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
>>>>>>> no-hm:hosts/nixos/modules/nvidia.nix
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
}
