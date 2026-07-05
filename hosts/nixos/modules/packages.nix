{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ 
    microcode-intel
  ];
}