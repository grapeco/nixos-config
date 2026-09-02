{ pkgs, ... }: {
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
    color-lsp
    asm-lsp
    cargo
    nixd
    clang
    nasm

    # Networking
    wireguard-tools
    nftables
    sstp
    torsocks
    
    # Other
    (btop.override {
      cudaSupport = true;
      rocmSupport = true;
    })
    unzip
    nix-prefetch-scripts
    yt-dlp
    appimage-run
    usbutils
  ];
}