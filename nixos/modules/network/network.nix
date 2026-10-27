{ hostname, pkgs, ... }: {
  networking = {
    hostName = hostname;
    nameservers = [ 
      "9.9.9.9" 
      "149.112.112.112" 
    ];
    networkmanager = {
      enable = true;
    };
    
    firewall = {
      enable = true;
      allowedTCPPorts = [ 
        9090 8118 # For TOR
        8080 # For my test web server
        5900 # For VNC vm
      ]; 
    };
  };

  boot.kernelModules = [ "tcp_bbr" ];
  boot.kernel.sysctl = {
    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.core.default_qdisc" = "fq";
  };
  
  environment.systemPackages = with pkgs; [
    # networkmanagerapplet
  ];

  programs.throne = {
    enable = true;
    tunMode.enable = true;
  };
  
  services.resolved = {
    enable = true;
  };
  
  programs.amnezia-vpn.enable = true;
  
  # services.zerotierone.enable = true;
}