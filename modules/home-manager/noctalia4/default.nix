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
  imports = [ inputs.noctalia4.homeModules.default ];

  config = lib.mkIf (cfg.environment == "noctalia4") {
    programs.noctalia-shell = {
      enable = true;
    };

    stylix.targets.noctalia-shell = {
      enable = true;
    };
  };
}
