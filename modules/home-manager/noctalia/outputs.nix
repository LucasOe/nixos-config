{ config, lib, ... }:

let
  # Only create lockscreen widgets for monitors with a configured width and height
  validMonitors = lib.filterAttrs (
    _: monitor: monitor.width != null && monitor.height != null
  ) config.my.monitors;

  padding = 123.0;
in
{
  programs.noctalia.settings = {
    # Generate lockscreen widgets for each monitor
    lockscreen_widgets = {
      enabled = true;
      schema_version = 1;

      widget_order = lib.concatLists (
        lib.mapAttrsToList (name: _: [
          "lockscreen-login-box@${name}"
          "lockscreen-widget-clock@${name}"
        ]) validMonitors
      );

      widget = lib.mkMerge (
        lib.mapAttrsToList (name: monitor: {
          "lockscreen-login-box@${name}" = {
            output = name;
            cx = monitor.width / 2.0;
            cy = monitor.height - padding;
            scale = 1.0;
            type = "login_box";
          };
          "lockscreen-widget-clock@${name}" = {
            output = name;
            cx = monitor.width / 2.0;
            cy = padding;
            scale = 1.8;
            type = "clock";
            settings.background = false;
          };
        }) validMonitors
      );
    };
  };
}
