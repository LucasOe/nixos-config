{ ... }:

let
  loadPreset = path: builtins.fromJSON (builtins.readFile path);
in
{
  services.easyeffects = {
    enable = true;
    extraPresets = {
      "Audeze LCD-2 Classic" = loadPreset ./output/audeze-lcd-2-classic.json;
      "Noise Supression" = loadPreset ./input/noise-supression.json;
    };
  };
}
