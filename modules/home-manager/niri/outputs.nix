{ config, lib, ... }:

let
  cfg = config.my.monitors;
in
{
  options.my.monitors = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          width = lib.mkOption {
            type = lib.types.nullOr lib.types.int;
            default = null;
            description = ''
              Effective monitor width in pixels after applying any rotation.
            '';
          };

          height = lib.mkOption {
            type = lib.types.nullOr lib.types.int;
            default = null;
            description = ''
              Effective monitor height in pixels after applying any rotation.
            '';
          };

          niri = lib.mkOption {
            type = lib.types.attrs;
            default = { };
            description = ''
              Additional Niri output configuration merged directly into the
              generated output definition.

              See the Niri output configuration documentation for supported
              attributes.
            '';
          };
        };
      }
    );

    default = { };

    example = {
      "DP-1" = {
        width = 3440;
        height = 1440;
        niri = {
          variable-refresh-rate._props.on-demand = true;
        };
      };
    };
  };

  config = {
    wayland.windowManager.niri.settings = {
      # https://niri-wm.github.io/niri/Configuration%3A-Outputs.html
      output = lib.mapAttrsToList (name: monitor: { _args = [ name ]; } // monitor.niri) cfg;
    };
  };
}
