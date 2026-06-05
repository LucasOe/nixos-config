{ config, lib, ... }:

let
  cfg = config.my.monitors;
in
{
  options.my.monitors = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule (
        { config, ... }:
        let
          rotated = builtins.elem (toString config.niri.transform or "0") [
            "90"
            "270"
          ];
        in
        {
          options = {
            width = lib.mkOption {
              type = lib.types.nullOr lib.types.int;
              default = null;
              description = ''
                Native horizontal resolution of the monitor in pixels.
              '';
            };

            height = lib.mkOption {
              type = lib.types.nullOr lib.types.int;
              default = null;
              description = ''
                Native vertical resolution of the monitor in pixels.
              '';
            };

            effectiveWidth = lib.mkOption {
              type = lib.types.nullOr lib.types.int;
              readOnly = true;
              description = ''
                Effective monitor width in pixels after applying any rotation.

                For monitors rotated by 90 or 270 degrees, this is equal to
                the configured height.
              '';
            };

            effectiveHeight = lib.mkOption {
              type = lib.types.nullOr lib.types.int;
              readOnly = true;
              description = ''
                Effective monitor height in pixels after applying any rotation.

                For monitors rotated by 90 or 270 degrees, this is equal to
                the configured width.
              '';
            };

            hasResolution = lib.mkOption {
              type = lib.types.bool;
              readOnly = true;
              description = ''
                Whether both width and height have been configured.
              '';
            };

            refreshRate = lib.mkOption {
              type = lib.types.nullOr lib.types.str;
              default = null;
              description = ''
                Refresh rate of the monitor.

                This value is appended to the generated Niri output mode string
                (for example: `3440x1440@143.923`).
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

          config = {
            hasResolution = config.width != null && config.height != null;

            effectiveWidth =
              if !config.hasResolution then
                null
              else if rotated then
                config.height
              else
                config.width;

            effectiveHeight =
              if !config.hasResolution then
                null
              else if rotated then
                config.width
              else
                config.height;
          };
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
