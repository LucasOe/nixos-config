{ config, lib, ... }:

let
  cfg = config.my.monitors;
in
{
  options.my.monitors = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule (
        { config, ... }:
        {
          options = {
            width = lib.mkOption {
              type = lib.types.nullOr lib.types.int;
              default = null;
            };

            height = lib.mkOption {
              type = lib.types.nullOr lib.types.int;
              default = null;
            };

            hasResolution = lib.mkOption {
              type = lib.types.bool;
              readOnly = true;
            };

            refreshRate = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
            };

            niri = lib.mkOption {
              type = lib.types.attrs;
              default = { };
            };
          };

          config.hasResolution = config.width != null && config.height != null;
        }
      )
    );

    default = { };

    example = {
      "DP-1" = {
        width = 3440;
        height = 1440;
        refreshRate = "144.0";
        niri = {
          variable-refresh-rate._props.on-demand = true;
        };
      };
    };
  };

  config = {
    # https://niri-wm.github.io/niri/Configuration%3A-Outputs.html
    wayland.windowManager.niri.settings.output = lib.mapAttrsToList (
      name: monitor:
      let
        # Set the monitor resolution and refresh rate in the format `<width>x<height>@<refreshRate>`
        # https://niri-wm.github.io/niri/Configuration%3A-Outputs.html#mode
        mode =
          "${toString monitor.width}x${toString monitor.height}"
          + lib.optionalString (monitor.refreshRate != null) "@${toString monitor.refreshRate}";
      in
      {
        _args = [ name ];
        mode = lib.mkIf monitor.hasResolution mode;
      }
      // monitor.niri
    ) cfg;
  };
}
