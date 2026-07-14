{
  config,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.scopebuddy;
in
{
  options.my.scopebuddy = {
    enable = lib.mkEnableOption "ScopeBuddy" // {
      default = nixosConfig.my.steam.enable;
      defaultText = lib.literalExpression "config.my.steam.enable";
    };

    gamescopeArgs = lib.mkOption {
      type = lib.types.str;
      default = "--prefer-output DP-1,eDP-1 --fullscreen --force-grab-cursor --mangoapp";
      example = "--prefer-output DP-1,eDP-1 --fullscreen --force-grab-cursor --mangoapp";
      description = ''
        Value for SCB_GAMESCOPE_ARGS. Passed to every gamescope launch
        unless overridden by a per-game config in ~/.config/scopebuddy/AppID/.
        See https://docs.bazzite.gg/Advanced/scopebuddy/
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ scopebuddy ];

    xdg.configFile."scopebuddy/scb.conf".text = ''
      export MANGOHUD=0
      SCB_GAMESCOPE_ARGS="${cfg.gamescopeArgs}"
      SCB_APPENDMODE=1
      SCB_AUTO_RES=1
      SCB_AUTO_HDR=1
      SCB_AUTO_VRR=1
    '';
  };
}
