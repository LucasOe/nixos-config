{ username, ... }:

{
  home-manager.users.${username} = {
    my.niri.monitors = {
      "DP-1" = {
        mode = "3440x1440@143.923";
        position._props.x = 0;
        position._props.y = 560;
        variable-refresh-rate._props.on-demand = true;
        focus-at-startup = [ ];
      };
      "DP-2" = {
        mode = "2560x1440@144.0";
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

    my.noctalia = {
      gpuMonitoring = true;
      monitors = {
        "DP-1" = {
          width = 3440;
          height = 1440;

          showBar = true;
          showNotifications = true;
          showOSD = true;
        };
        "DP-2" = {
          width = 1440;
          height = 2560;
        };
      };
    };
  };
}
