{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.via;
in
{
  options.my.via = {
    enable = lib.mkEnableOption "VIA";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.via ];
    # Permit to run via for /dev/hidraw*
    services.udev.packages = [ pkgs.via ];
  };
}
