{ config, lib, pkgs, inputs, ... }:

{
  imports = [  
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  home-manager.backupFileExtension = "backup";

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      theme = pkgs.fetchFromGitHub {
        owner = "shvchk";
        repo = "fallout-grub-theme";
        rev = "80734103d0b48d724f0928e8082b6755bd3b2078";
        sha256 = "sha256-7kvLfD6Nz4cEMrmCA9yq4enyqVyqiTkVZV5y4RyUatU=";
      };
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
  };

  boot.extraModulePackages = [ config.boot.kernelPackages.rtl8192eu ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = ["en_US.UTF-8/UTF-8" "ru_RU.UTF-8/UTF-8"];
  
  services.resolved.enable = true;

  services.displayManager.sddm = {
    enable = true;
    theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    videoDrivers = ["nvidia"];
  };

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password"; 
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  users.users.nox = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
    packages = with pkgs; [
      tree
    ];
  };

  programs.bash = {
    interactiveShellInit = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
        exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
      fi
    '';
  };

  programs.hyprland = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    vim 
    usbutils
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
  ];

  nixpkgs.config.allowUnfree = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

