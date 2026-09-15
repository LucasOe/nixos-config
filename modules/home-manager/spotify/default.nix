{
  config,
  inputs,
  lib,
  nixosConfig,
  ...
}:

let
  cfg = config.my.spotify;
in
{
  options.my.spotify = {
    enable = lib.mkEnableOption "Spotify" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };
  };

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  config = lib.mkIf cfg.enable {
    programs.spicetify = {
      enable = true;

      alwaysEnableDevTools = true;
      experimentalFeatures = true;

      # Custom CSS
      theme.name = "custom";
      theme.src = ./theme;
      theme.homeConfig = false;

      # Extensions
      enabledExtensions = [ ];
    };
  };
}
