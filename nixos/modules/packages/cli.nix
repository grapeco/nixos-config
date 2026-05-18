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
    cargo
    nixd
    clang
    clang-tools
    nasm
    
    # Other
    wireguard-tools
    sstp
    btop
    unzip
    nix-prefetch-scripts
    yt-dlp
    appimage-run
    inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}