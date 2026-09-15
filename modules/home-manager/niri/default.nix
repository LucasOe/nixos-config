{
  config,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.niri;
in
{
  options.my.niri = {
    enable = lib.mkEnableOption "niri" // {
      default = nixosConfig.my.niri.enable;
      defaultText = lib.literalExpression "nixosConfig.my.niri.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.niri = {
      enable = true;
      package = nixosConfig.my.niri.package;

      # Already set by the NixOS module
      portalPackage = null;
      systemd.enable = false;
    };

    home.packages = with pkgs; [
      wl-clipboard-rs
    ];
  };
}
