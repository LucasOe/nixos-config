{
  config,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.obs-studio;
in
{
  options.my.obs-studio = {
    enable = lib.mkEnableOption "OBS Studio" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;

      plugins = with pkgs.obs-studio-plugins; [
        obs-pipewire-audio-capture
        obs-vaapi
      ];
    };
  };
}
