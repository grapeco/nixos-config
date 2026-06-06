{ hostname, pkgs, ... }: {
  networking = {
    hostName = hostname;
    nameservers = [ 
      "9.9.9.9" 
      "149.112.112.112" 
    ];
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-sstp
      ];
    };
    
    firewall = {
      enable = true;
      allowedTCPPorts = [ 
        9090 # For TOR
        8080 # For my test web server
        5900 # For VNC vm
      ]; 
    };
  };
  
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
  
  services.resolved = {
    enable = true;
  };
  
  programs.amnezia-vpn.enable = true;
  
  services.zerotierone.enable = true;
}