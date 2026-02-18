{
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "amdgpu" ];
    
    boot.kernelModules = [ "amdgpu" ];
}