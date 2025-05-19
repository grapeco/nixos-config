{ ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      opacity = 0;
    };
  };
}