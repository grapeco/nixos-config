{
  imports = [
    # ./bash.nix
    ./grub.nix
    ./hyprland.nix
    ./nh.nix
    ./system.nix
    ./postgresql.nix
    ./services.nix
    ./fonts.nix
    ./base-packages.nix
    ./user.nix
    ./nix-ld.nix
    ./steam.nix

    ./sddm
    ./plymouth
    ./network
    ./virtualization
    ./hardware
    ./packages
  ];
}
