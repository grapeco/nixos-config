set fish_greeting
starship init fish | source

alias rebuild='sudo nixos-rebuild switch --flake ./'
alias garbage='sudo nix-collect-garbage -d'
alias update='sudo nix flake update'

alias ls='eza --color=always --git --icons=always'
alias tree='eza --color=always --git --icons=always --tree'

# alias zeditor='export GPUI_X11_SCALE_FACTOR=1.2 && env -u WAYLAND_DISPLAY zeditor && exit'

alias stop-zapret='sudo systemctl stop zapret-discord-youtube'
alias start-zapret='sudo systemctl start zapret-discord-youtube'