{ pkgs, ... }: {
  services.displayManager.sddm = {
    enable = true;
    theme = "${pkgs.stdenv.mkDerivation {
      name = "sddm-theme";
      src = pkgs.fetchFromGitHub {
        owner = "JaKooLit";
        repo = "simple-sddm";
        rev = "afd038e57f8c678a14adf3fd9407a44dde5a660b";
        sha256 = "1xhyri8gfzkz15z570slq1zr8a83q1c0zi80fny6syz0l8f2jkip";
      };
      installPhase = ''
        mkdir -p $out
        cp -R ./* $out/
      '';
    } }";
  };
}