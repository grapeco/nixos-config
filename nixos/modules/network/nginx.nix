{
  services.nginx = {
    enable = true;
    virtualHosts."_" = {
      listen = [
        { addr = "0.0.0.0"; port = 8080; }
      ];
    };
  };
}
