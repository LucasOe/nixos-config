{ config, lib, ... }:

let
  cfg = config.my.displayManager;
in
{
  options.my.displayManager.default = lib.mkOption {
    type = lib.types.enum [
      "dms"
      "gdm"
      "greetd"
    ];
    default = "greetd";
    description = "Display Manager";
  };

  config = {
    my.displayManager.dms.enable = cfg.default == "dms";
    my.displayManager.gdm.enable = cfg.default == "gdm";
    my.displayManager.greetd.enable = cfg.default == "greetd";
  };
}
