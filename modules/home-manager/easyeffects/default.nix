{ config, lib, ... }:

let
  cfg = config.my.easyeffects;

  loadPreset = path: builtins.fromJSON (builtins.readFile path);
in
{
  options.my.easyeffects = {
    enable = lib.mkEnableOption "EasyEffects";
  };

  config = lib.mkIf cfg.enable {
    services.easyeffects = {
      enable = true;

      extraPresets = {
        "Audeze LCD-2 Classic" = loadPreset ./output/audeze-lcd-2-classic.json;
        "Noise Supression" = loadPreset ./input/noise-supression.json;
      };
    };
  };
}
