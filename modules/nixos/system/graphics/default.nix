{ config, lib, ... }:

let
  cfg = config.my.gui;
in
{
  options.my.gui = {
    enable = lib.mkEnableOption "GUI modules" // {
      default = true;
      defaultText = lib.literalExpression "true";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
