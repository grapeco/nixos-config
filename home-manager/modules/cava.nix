{ ... }: 
{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        bars = 48;
        autosens = 1;
        framerate = 100;
        sensitivity = 80;
        threading = 1;
        autobar_width = 1;
      };
      output = {
        style = "wave";
        bar_spacing = -1;
        ascii_max_range = 3;
        reverse = 0;
      };
      color = {
        gradient = 1;
        gradient_count = 5;
        gradient_color_1 = "#00008B";
        gradient_color_2 = "#00BFFF";
        gradient_color_3 = "#FF4500";
        gradient_color_4 = "#FF0000";
        gradient_color_5 = "#FFFF00";
        foreground_alpha = 0.7;
      };
      smoothing = {
        noise_reduction = 25;
        integral = 92;
        gravity = 105;
        overshoot = 15;
      };
    };
  };
}