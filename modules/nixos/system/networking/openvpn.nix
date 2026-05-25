{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.openvpn;
in
{
  options.my.openvpn = {
    enable = lib.mkEnableOption "OpenVPN";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.openvpn ];
    networking.networkmanager.plugins = [ pkgs.networkmanager-openvpn ];
  };
}
