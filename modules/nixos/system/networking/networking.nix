{ ... }:

{
  # https://github.com/NixOS/nixpkgs/issues/87802
  boot.kernelParams = [ "ipv6.disable=1" ];

  networking = {
    networkmanager.enable = true;
    enableIPv6 = false; # https://github.com/NixOS/nixpkgs/issues/87802

    # Firewall
    firewall.enable = true;
    firewall.allowedTCPPorts = [ 22 ];
    firewall.checkReversePath = false;
  };
}
