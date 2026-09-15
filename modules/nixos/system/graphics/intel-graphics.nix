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
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    # Enable hardware encoding for Intel Graphics
    hardware.graphics.extraPackages = with pkgs; [
      vpl-gpu-rt
      intel-media-driver
      libvdpau-va-gl
    ];

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "iHD"; # Force intel-media-driver
    };
  };
}
