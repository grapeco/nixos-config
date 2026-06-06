{ pkgs, ... }: {
  services.flatpak.enable = true;
  
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };
  
  # systemd.services.rudesktop = {
  #   after = [ "systemd-user-sessions.service" ];
  #   wantedBy = [ "multi-user.target" ];
  #   requires = [ "network.target" ];
  #   serviceConfig = {
  #     ExecStart = "/home/nox/Downloads/temping/usr/bin/rudesktop --dispatcher";
  #     Restart = "always";
  #   };
  # };
  
  # systemd.user.services.rudesktop-user = {
  #   serviceConfig = {
  #     Type = "simple";
  #     ExecStart = "/usr/bin/env /home/nox/Downloads/temping/usr/bin/rudesktop --session";
  #     KillMode = "process";
  #     TimeoutStopSec=30;
  #     LimitNOFILE=100000;
  #     Restart="on-failure";
  #     RestartSec=1;
  #     SuccessExitStatus=0;
  #   };
  # };
}