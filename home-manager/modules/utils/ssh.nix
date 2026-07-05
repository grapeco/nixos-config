{ user, ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "/home/${user}/.ssh/github";
      };
      "github" = {
        hostname = "github.com";
        user = "git";
        identityFile = "/home/${user}/.ssh/github";
      };
    };
  };
}
