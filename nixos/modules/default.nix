{
  imports = [
    ./bash.nix
    ./grub.nix
    ./hyprland.nix
    ./nh.nix
    ./system.nix
    ./postgresql.nix
    ./flatpak.nix
    ./fonts.nix
    ./packages.nix
    ./user.nix
    # ./nix-ld.nix

    ./sddm
    ./network
    ./virtualization
    ./hardware
  ];
}
