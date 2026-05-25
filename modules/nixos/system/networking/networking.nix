{ pkgs, ... }:

{
  # https://github.com/NixOS/nixpkgs/issues/87802
  boot.kernelParams = [ "ipv6.disable=1" ];

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];

  networking = {
    networkmanager.enable = true;
    enableIPv6 = false; # https://github.com/NixOS/nixpkgs/issues/87802

    # Firewall
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 ];
    firewall.checkReversePath = false;
  };

  # Enable the OpenSSH daemon
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no"; # disable root login
      KbdInteractiveAuthentication = false; # disable keyboard-interactive authentication
      PasswordAuthentication = false; # disable password login
    };
  };
}
