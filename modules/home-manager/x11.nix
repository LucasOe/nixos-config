{
  config,
  lib,
  nixosConfig,
  ...
}:

let
  cfg = config.my.x11;
in
{
  options.my.x11 = {
    enable = lib.mkEnableOption "X11 configuration" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    home.pointerCursor = {
      enable = true;

      package = nixosConfig.theme.cursor.package;
      name = nixosConfig.theme.cursor.name;
      size = nixosConfig.theme.cursor.size;

      x11.enable = true;
    };
  };
}
