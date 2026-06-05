{ config, lib, ... }:

let
  cfg = config.my.noctalia.monitors;
  padding = 123;
in
{
  options.my.noctalia.monitors = lib.mkOption {
    type = lib.types.attrsOf (
      lib.types.submodule {
        options = {
          width = lib.mkOption {
            type = lib.types.int;
            description = ''
              Effective monitor width in pixels after applying any rotation.
            '';
          };

          height = lib.mkOption {
            type = lib.types.int;
            description = ''
              Effective monitor height in pixels after applying any rotation.
            '';
          };
        };
      }
    );
    default = { };
    example = {
      "DP-1" = {
        width = 1920;
        height = 1080;
      };
    };
  };

  config = {
    programs.noctalia.settings = {
      # Generate lockscreen widgets for each monitor
      lockscreen_widgets = {
        enabled = true;
        schema_version = 1;

        widget_order = lib.concatLists (
          lib.mapAttrsToList (name: _: [
            "lockscreen-login-box@${name}"
            "lockscreen-widget-clock@${name}"
          ]) cfg
        );

        widget = lib.mergeAttrsList (
          lib.mapAttrsToList (name: attrs: {
            "lockscreen-login-box@${name}" = {
              output = name;
              cx = attrs.width / 2.0;
              cy = attrs.height - padding;
              scale = 1.0;
              type = "login_box";
            };
            "lockscreen-widget-clock@${name}" = {
              output = name;
              cx = attrs.width / 2.0;
              cy = padding;
              scale = 1.8;
              type = "clock";
              settings.background = false;
            };
          }) cfg
        );
      };
    };
  };
}
