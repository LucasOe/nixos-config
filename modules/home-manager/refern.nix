{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.refern;
in
{
  options.my.refern = {
    enable = lib.mkEnableOption "refern";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ refern ];
  };
}
