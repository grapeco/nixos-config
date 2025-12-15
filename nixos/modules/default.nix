{
  imports = [
    ./bash.nix
    ./grub.nix
    ./hyprland.nix
    ./nh.nix
    ./steam.nix
    ./system.nix
    ./postgresql.nix
    ./flatpak.nix

    ./sddm
    ./graphics/nvidia.nix
    ./network
    ./virtualization
    ./hardware
  ];
}
