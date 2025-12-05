{ username, ... }:

{
  imports = [
    ./hardware-configuration.nix # Generated (nixos-generate-config) hardware configuration
    ./certificates.nix # HSHL Root certificates
  ];

  # Enable networking
  networking = {
    hostName = "laptop";

    networkmanager.enable = true;

    defaultGateway = "192.168.2.1";
    nameservers = [ "192.168.2.208" ];

    # Set static IP address
    interfaces.wlp0s20f3.ipv4.addresses = [
      {
        address = "192.168.2.205";
        prefixLength = 24;
      }
    ];

    # Firewall
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 ];
  };

  # Enable Bluetooth
  hardware.bluetooth.enable = true;

  # Services
  services.power-profiles-daemon.enable = true; # Power-profiles
  services.upower.enable = true; # Battery management

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
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJQfqJnnqE7DxuGPh1ia7DlsoZMSenVPq2ND0X34dvBo"
    ];
  };
}
