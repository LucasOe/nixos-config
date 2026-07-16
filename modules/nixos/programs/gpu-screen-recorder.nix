{ config, lib, ... }:

let
  cfg = config.my.gpu-screen-recorder;
in
{
  options.my.gpu-screen-recorder = {
    enable = lib.mkEnableOption "GPU Screen Recorder";
  };

  config = lib.mkIf cfg.enable {
    programs.gpu-screen-recorder.enable = true;
  };
}
