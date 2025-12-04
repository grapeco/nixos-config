{ ... }: {
  services.gammastep = {
    enable = true;
    provider = "manual";
    dawnTime = "00:00";
    duskTime = "00:00";
    temperature = {
      day = 4500;
      night = 4500;
    };
  };
}
