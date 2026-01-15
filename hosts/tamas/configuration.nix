{
  config,
  configLib,
  pkgs,
  username,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix # Generated (nixos-generate-config) hardware configuration
    (configLib.relativeToRoot "modules/nixos/programs/steam.nix") # Steam
  ];

  # Enable networking
  networking = {
    hostName = "tamas";

    networkmanager.enable = true;

    # Firewall
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 ];
    firewall.checkReversePath = false;
  };

  # Keymap
  services.xserver.xkb = {
    layout = "eu"; # Alternatively use 'de'
    variant = ""; # Alternatively use 'us'
  };

  # Console keymap
  console.keyMap = "de";

  # Enable ratbagd for configuring gaming mice
  services.ratbagd.enable = true;

  # https://github.com/Gnarus-G/maccel/blob/main/README_NIXOS.md
  hardware.maccel = {
    enable = true;
    enableCli = true;

    parameters = {
      sensMultiplier = 0.50;
      inputDpi = 1600.0;

      mode = "linear";
      acceleration = 0.02;
      offset = 5.0;
      outputCap = 2.0;
    };
  };

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    open = true;

    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "Lucas Oelker";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  # User Packages
  home-manager.users.${username} = {
    home.packages = with pkgs; [
      gdlauncher-carbon
      cartridges
    ];
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    (bottles.override { removeWarningPopup = true; })
    heroic
    networkmanagerapplet
    piper
    via
  ];

  # Permit to run via for /dev/hidraw*
  services.udev.packages = with pkgs; [
    via
  ];

  # Flatpak
  services.flatpak.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
