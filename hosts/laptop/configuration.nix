{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system.nix
    ../../modules/dms.nix
    ./modules
    inputs.dankMaterialShell.nixosModules.greeter
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

  # Keymap
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Console keymap
  console.keyMap = "de";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.lucas = {
    isNormalUser = true;
    description = "Lucas Oelker";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJQfqJnnqE7DxuGPh1ia7DlsoZMSenVPq2ND0X34dvBo lucas.oelker@proton.me"
    ];
  };

  # Fonts
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  # Install nix-ld for VSCode code-server
  programs.nix-ld.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [ ];
}
