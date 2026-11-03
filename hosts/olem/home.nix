{ username, ... }:

{
  home-manager.users.${username} = {
    my.niri.monitors = {
      "eDP-1" = {
        scale = 1.5;
        variable-refresh-rate = [ ];

        layout = {
          default-column-width.proportion = 1.0;
          preset-column-widths._children = [ { proportion = 0.5; } ];
        };
      };
    };

    my.noctalia.monitors = {
      "eDP-1" = {
        width = 2256;
        height = 1504;

        showBar = true;
        showNotifications = true;
        showOSD = true;
      };
    };
  };
}
