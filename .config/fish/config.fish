set fish_greeting
starship init fish | source

alias rebuild='sudo nixos-rebuild switch --flake ./'
alias garbage='sudo nix-collect-garbage -d'
alias update='sudo nix flake update'

alias ls='eza --color=always --git --icons=always'
alias tree='eza --color=always --git --icons=always --tree'