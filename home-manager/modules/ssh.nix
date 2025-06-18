{ user, ... }: {
  programs.ssh = {
    enable = true;

    matchBlocks = {
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
