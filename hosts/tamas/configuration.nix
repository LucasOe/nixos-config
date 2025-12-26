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
