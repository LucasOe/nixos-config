{
  config,
  inputs,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.sone;
in
{
  options.my.sone = {
    enable = lib.mkEnableOption "SONE" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      # https://github.com/lullabyX/sone/issues/16
      (pkgs.symlinkJoin {
        name = "sone";
        paths = [ inputs.sone.packages.${pkgs.stdenv.hostPlatform.system}.sone ];
        nativeBuildInputs = [ pkgs.makeWrapper ];
        postBuild = ''
          wrapProgram $out/bin/sone \
            --set WEBKIT_DISABLE_DMABUF_RENDERER "0" \
            --set WEBKIT_DISABLE_COMPOSITING_MODE "0"
        '';
      })
    ];

    xdg.configFile."sone/theme.json" = {
      force = true;
      text = builtins.toJSON {
        version = 1;
        preset = "custom";
        custom = {
          accent = nixosConfig.theme.colors.withHashtag.base0B;
          background = nixosConfig.theme.colors.withHashtag.base00;
        };
      };
    };
  };
}
