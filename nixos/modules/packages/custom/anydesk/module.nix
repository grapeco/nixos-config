{ config, lib, pkgs, ... }: 
let 
  cfg = config.services.anydesk; 
  package = pkgs.callPackage ./package.nix {}; 
in { 
  options.services.anydesk = { 
    enable = lib.mkEnableOption "AnyDesk"; 
  }; 

  config = lib.mkIf cfg.enable { 
    environment.systemPackages = [ package ]; 
    systemd.packages = [ package ];
    systemd.services.anydesk.wantedBy = [ "multi-user.target" ]; 
  }; 
}