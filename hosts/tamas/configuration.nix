{ username, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Generated (nixos-generate-config) hardware configuration
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
    layout = "de";
    variant = "us";
  };

  # Console keymap
  console.keyMap = "de";

  # https://github.com/Gnarus-G/maccel/blob/main/README_NIXOS.md
  hardware.maccel = {
    enable = true;
    enableCli = true;

    parameters = {
      sensMultiplier = 0.25;
      inputDpi = 1600.0;

      mode = "linear";
      acceleration = 0.03;
      offset = 7.0;
      outputCap = 2.0;
    };
  };

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    open = true;
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

  # System Packages
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
