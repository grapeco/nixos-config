{
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "performance";
      TLP_PROFILE_AC = "PRF";
      TLP_PROFILE_BAT = "SAV";
      AMDGPU_ABM_LEVEL_ON_AC = 0;
      AMDGPU_ABM_LEVEL_ON_BAT = 0;
      AMDGPU_ABM_LEVEL_ON_SAV = 0;

    };
  };

  services.logind.settings.Login.HandlePowerKey = "ignore";
  
  # services.logind = {
  #   lidSwitch = "ignore";
  #   lidSwitchExternalPower = "ignore";
  # };
}