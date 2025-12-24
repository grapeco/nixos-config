{ pkgs, ... }: {
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      allow_images = true;
      width = 450;
      height = 450;
    };
  };

  # programs.rofi = {
  #   # enable = true;
  #   cycle = true;
  #   # Set terminal to kitty
  #   terminal = "${pkgs.kitty}/bin/kitty";
  # };
}
