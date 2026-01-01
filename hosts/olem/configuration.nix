{ username, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Generated (nixos-generate-config) hardware configuration
    ./certificates.nix # HSHL Root certificates
  ];

  # Enable networking
  networking = {
    hostName = "olem";

    networkmanager.enable = true;

    # Firewall
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 ];
    firewall.checkReversePath = false;
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Laptop Services
  services.power-profiles-daemon.enable = true; # Power-profiles
  services.upower.enable = true; # Battery management
  services.thermald.enable = true; # Prevents overheating on Intel CPUs

  # Enable hardware encoding for Intel Graphics
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-media-driver
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD"; # Force intel-media-driver
  };

  # Keymap
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Console keymap
  console.keyMap = "de";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "Lucas Oelker";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJQfqJnnqE7DxuGPh1ia7DlsoZMSenVPq2ND0X34dvBo"
    ];
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    adw-bluetooth
    networkmanagerapplet
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
