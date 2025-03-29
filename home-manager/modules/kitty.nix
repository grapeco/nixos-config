{lib, ...}: {
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.5";
      background_blur = 5;  

      font_size = 12;
      font_family = "Operator Mono Book";
      bold_font = "Operator Mono Medium";
      italic_font = "Operator Mono Book Italic";
      bold_italic_font = "Operator Mono Medium Italic";
    };
  };
}