{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.displayManager.greetd;
in
{
  options.my.displayManager.greetd = {
    enable = lib.mkEnableOption "greetd";
  };

  config = lib.mkIf cfg.enable {
    services.greetd = {
      enable = true;
      useTextGreeter = true;
      settings = {
        default_session = {
          command = "${lib.getExe pkgs.tuigreet} --asterisks --remember --cmd ${lib.getExe' config.programs.niri.package "niri-session"}";
          user = "greeter";
        };
      };
    };
  };
}
