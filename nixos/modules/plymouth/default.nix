{ pkgs, ... }:
{
  boot = {
    kernelParams = [
      # "quiet"
      # "rd.udev.log_level=3"
      # "rd.systemd.show_status=auto"
    ];
  };

  boot.plymouth = {
    # enable = true;
    theme = "catppuccin-mocha";
    themePackages = [
      # (pkgs.stdenv.mkDerivation {
      #   pname = "plymouth-theme-simple";
      #   version = "1.0";

      #   src = ./simple;

      #   installPhase = ''
      #     mkdir -p $out/share/plymouth/themes/simple
      #     cp -r * $out/share/plymouth/themes/simple/

      #     substituteInPlace $out/share/plymouth/themes/simple/simple.plymouth \
      #       --replace "/usr" "$out"
      #   '';
      # })
      (pkgs.catppuccin-plymouth.override {
        variant = "mocha";
      })
    ];
  };
}
