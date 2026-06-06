{ pkgs, ... }: {
  services.fprintd = {
    enable = true;
  };
  
  security.pam.services = {
    login = {
      fprintAuth = true;
      rules.auth = {
        unix.order = 1;
        fprintd.order = 2;
      };
    };
    
    hyprlock = {
      fprintAuth = true;
      rules.auth = {
        unix.order = 1;
        fprintd.order = 2;
      };
    };
    
    sudo = {
      fprintAuth = true;
      rules.auth = {
        unix.order = 1;
        fprintd.order = 2;
      };
    };
  };
}