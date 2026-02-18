{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Games
    umu-launcher
    
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
    nixd
    clang
    clang-tools
    nasm
    lunarvim
    
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