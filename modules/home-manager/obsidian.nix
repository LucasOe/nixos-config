{
  config,
  lib,
  nixosConfig,
  ...
}:

let
  cfg = config.my.obsidian;
in
{
  options.my.obsidian = {
    enable = lib.mkEnableOption "Obsidian" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.obsidian = {
      enable = true;
    };
  };
}
