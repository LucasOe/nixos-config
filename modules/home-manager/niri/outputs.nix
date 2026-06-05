{ config, lib, ... }:

let
  cfg = config.my.niri.monitors;
in
{
  options.my.niri.monitors = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        freeformType = lib.types.attrs;
      }
    );
    default = { };
    description = ''
      Niri output configuration merged directly into the generated output definition.
      See the Niri output configuration documentation for supported attributes.
    '';
    example = {
      "DP-1" = {
        variable-refresh-rate._props.on-demand = true;
      };
    };
  };

  config = {
    wayland.windowManager.niri.settings = {
      # https://niri-wm.github.io/niri/Configuration%3A-Outputs.html
      output = lib.mapAttrsToList (name: attrs: { _args = [ name ]; } // attrs) cfg;
    };
  };
}
