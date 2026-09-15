{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.kdeconnect;
in
{
  options.my.kdeconnect = {
    enable = lib.mkEnableOption "KDE Connect" // {
      default = config.my.gui.enable;
      defaultText = lib.literalExpression "config.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.kdeconnect = {
      enable = true;
      package = pkgs.valent;
    };
  };
}
