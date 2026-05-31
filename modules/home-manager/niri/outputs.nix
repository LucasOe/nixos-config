{ ... }:

{
  # https://niri-wm.github.io/niri/Configuration%3A-Outputs.html
  wayland.windowManager.niri.settings.output = [
    {
      # Laptop monitor
      _args = [ "eDP-1" ];
      scale = 1.5;
    }
    {
      # Desktop primary monitor
      _args = [ "DP-1" ];
      position._props.x = 0;
      position._props.y = 560;
      mode = "3440x1440@143.923";
      variable-refresh-rate._props.on-demand = true;
      focus-at-startup = [ ];
    }
    {
      # Desktop secondary vertical monitor
      _args = [ "DP-2" ];
      transform = "270";
      position._props.x = 3440;
      position._props.y = 0;
      mode = "2560x1440@144.0";
      variable-refresh-rate._props.on-demand = true;

      layout = {
        default-column-width.proportion = 1.0;
        preset-column-widths._children = [ { proportion = 1.0; } ];
      };
    }
  ];
}
