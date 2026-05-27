{
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.my.niri;
in
{
  imports = [ inputs.noctalia5.homeModules.default ];

  config = lib.mkIf (cfg.environment == "noctalia5") {
    programs.noctalia = {
      enable = true;
    };
  };
}
