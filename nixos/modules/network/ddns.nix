{ pkgs, ... }:
let
  token = pkgs.writeText "ddns-token" "42e30b72-5f09-4d2c-ba6c-83e57cccd57b";
in {
  services.ddclient = {
    enable = true;
    domains = [ "helico.ddnsfree.com " ];
    usev4 = "webv4, webv4=ifconfig.me";
    passwordFile = "${token}";
    interval = "5min";
  };
}
