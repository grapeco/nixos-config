{ hostname, ... }: {
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
      allowedTCPPorts = [ 9090 ]; # For TOR
    };
  };
  
  services.resolved = {
    enable = true;
  };
  
  programs.amnezia-vpn.enable = true;
  
  services.zerotierone.enable = true;
}