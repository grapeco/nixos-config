{ hostname, ... }: {
  networking = {
    hostName = hostname;
    nameservers = [ "9.9.9.9" "149.112.112.112" ];
    networkmanager = {
      enable = true;
    };
  };
  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSOverTLS = "true";
      DNSSEC = "true";
    };
  };
}