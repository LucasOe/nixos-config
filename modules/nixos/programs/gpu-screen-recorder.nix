{ config, lib, ... }:

let
  cfg = config.my.gpu-screen-recorder;
in
{
  options.my.gpu-screen-recorder = {
    enable = lib.mkEnableOption "GPU Screen Recorder" // {
      default = config.my.gui.enable;
      defaultText = lib.literalExpression "config.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.gpu-screen-recorder.enable = true;
  };
}
