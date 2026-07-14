{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    # Games
    umu-launcher
    javaPackages.compiler.temurin-bin.jre-25
    wine
    
    # Rice  
    cmatrix
    fastfetch
    stow
    cava
    starship 
    eza
    fish
    awww
    
    # Languages
    rustc
    rust-analyzer
    cargo
    nixd
    clang
    nasm
    
    # Other
    wireguard-tools
    nftables
    sstp
    btop
    unzip
    nix-prefetch-scripts
    yt-dlp
    appimage-run
    usbutils
    inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}