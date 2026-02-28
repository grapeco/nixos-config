{ pkgs, ... }: {
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      UseBridges = true;
      BandwidthRate = "500KB";
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      HTTPTunnelPort = 8118;
      Bridge = "obfs4 45.89.127.227:9111 F115B8D1A5F6D31F90197DA9C6EC87914D7753E6 cert=meQuUToGFnzg5dnlW1or8jbQgKAImmntGkUgv+I82H3hbOPUlCLpzM6cHdphYoCxoSaHOQ iat-mode=0";    
    };
  };
  
  programs.proxychains = {
    enable = true;
    
    proxies = {
      tor = {
        enable = true;
        type = "socks5";       
        host = "127.0.0.1";     
        port = 9050;            
      };
    };
    
    chain = {
      type = "dynamic";          # dynamic chain - работает, даже если некоторые прокси недоступны
    };
    proxyDNS = true;                   # Проксировать DNS через Tor (предотвращает утечки)
    quietMode = true; 
  };
}