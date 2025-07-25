{ pkgs, config, ... }: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

  services.xserver.videoDrivers = ["nvidia"];
}
