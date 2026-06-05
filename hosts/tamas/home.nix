{ username, ... }:

{
  home-manager.users.${username} = {
    my.monitors = {
      "DP-1" = {
        width = 3440;
        height = 1440;
        refreshRate = "143.923";

        niri = {
          position._props.x = 0;
          position._props.y = 560;
          variable-refresh-rate._props.on-demand = true;
          focus-at-startup = [ ];
        };
      };
      "DP-2" = {
        width = 2560;
        height = 1440;
        refreshRate = "144.0";

        niri = {
          transform = "270";
          position._props.x = 3440;
          position._props.y = 0;
          variable-refresh-rate._props.on-demand = true;

          layout = {
            default-column-width.proportion = 1.0;
            preset-column-widths._children = [ { proportion = 1.0; } ];
          };
        };
      };
    };

    my.noctalia.gpuMonitoring = true;
  };
}
