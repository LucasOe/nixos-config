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

          scale = lib.mkOption {
            type = lib.types.float;
            default = 1.0;
          };

          showBar = lib.mkEnableOption "Show the bar for this monitor.";
          showNotifications = lib.mkEnableOption "Show notification toasts for this monitor.";
          showOSD = lib.mkEnableOption "Show OSD popups for this monitor.";
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
      # Set wallpaper
      wallpaper.monitors = lib.mapAttrs (_: attrs: {
        path = config.stylix.image;
      }) cfg;

      # Show/Hide bar
      bar.default.monitor = lib.mapAttrs (_: attrs: {
        enabled = attrs.showBar;
      }) cfg;

      # Show/Hide notications toasts
      notification.monitors = lib.attrNames (lib.filterAttrs (_: attrs: attrs.showNotifications) cfg);

      # Show/Hide OSD popups
      osd.monitors = lib.attrNames (lib.filterAttrs (_: attrs: attrs.showOSD) cfg);

      # Generate lockscreen widgets
      lockscreen_widgets = {
        enabled = true;
        schema_version = 1;

        widget_order = lib.concatLists (
          lib.mapAttrsToList (name: _: [
            "lockscreen-login-box@${name}"
            "lockscreen-widget-date@${name}"
            "lockscreen-widget-clock@${name}"
          ]) cfg
        );

        widget = lib.mergeAttrsList (
          lib.mapAttrsToList (name: attrs: {
            "lockscreen-login-box@${name}" = {
              output = name;
              cx = attrs.width / attrs.scale / 2.0;
              cy = attrs.height / attrs.scale - padding;
              box_width = 400.0;
              box_height = 70.0;
              type = "login_box";
            };
            "lockscreen-widget-date@${name}" = {
              output = name;
              cx = attrs.width / attrs.scale / 2.0;
              cy = padding;
              box_width = 768.0;
              box_height = 64.0;
              type = "clock";
              settings.background = false;
              settings.format = "{:%a, %b %d}";
            };
            "lockscreen-widget-clock@${name}" = {
              output = name;
              cx = attrs.width / attrs.scale / 2.0;
              cy = padding + 112;
              box_width = 768.0;
              box_height = 160.0;
              type = "clock";
              settings.background = false;
              settings.format = "{:%H:%M}";
            };
          }) cfg
        );
      };
    };
  };
}
