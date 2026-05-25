{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.intel-graphics;
in
{
  options.my.intel-graphics = {
    enable = lib.mkEnableOption "Intel Graphics";
  };

  config = lib.mkIf cfg.enable {
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
  };
}
