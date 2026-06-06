{ pkgs, ... }: 
{
  services.tor = {
    enable = true;
    client.enable = true;
    settings = {
      UseBridges = true;
      ExcludeNodes = "{cn},{ru},{hk},{mo}"; 
      
      AvoidDiskWrites = 1; 
      
      SOCKSPort = [
        { addr = "0.0.0.0"; port = 9090; }
      ];
      
      ClientTransportPlugin = "obfs4 exec ${pkgs.obfs4}/bin/lyrebird";
      Bridge = [  
        "obfs4 45.89.127.227:9111 F115B8D1A5F6D31F90197DA9C6EC87914D7753E6 cert=meQuUToGFnzg5dnlW1or8jbQgKAImmntGkUgv+I82H3hbOPUlCLpzM6cHdphYoCxoSaHOQ iat-mode=0"
        "obfs4 89.234.140.172:9003 6D9484C1E4C367D4469361B420126BECCFB7F0AF cert=fcI1z9Ze0B7bgrQJy8ipLlX41LiYp53zBZ8Z0/luJ/A9hmQ9uywySMSgAbkMHe3ltt+WKA iat-mode=0"
      ];
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
      type = "dynamic";
    };
    proxyDNS = true;
    quietMode = true; 
  };
}