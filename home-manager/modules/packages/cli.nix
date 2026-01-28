{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Games
    umu-launcher
    steamcmd
    
    # Rice  
    cmatrix
    fastfetch
    stow
    cava
    starship 
    eza
    fish
    swww
    
    # Languages
    rustc
    cargo
    jdk
    nixd
    clang
    clang-tools
    nasm
    
    # Other
    wireguard-tools
    btop
    unzip
    nix-prefetch-scripts
    lunarvim
    yt-dlp
    appimage-run
  ];
}