{
  services.tlp = {
    enable = true;
    settings = {
      TLP_PROFILE_AC = "PRF";
      TLP_PROFILE_BAT = "SAV";
    };
  };
  
  # services.logind = {
  #   lidSwitch = "ignore";
  #   lidSwitchExternalPower = "ignore";
  # };
}