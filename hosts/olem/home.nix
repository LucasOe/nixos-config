{ username, ... }:

{
  home-manager.users.${username} = {
    my.niri.monitors = {
      "eDP-1" = {
        scale = 1.5;
        variable-refresh-rate = [ ];
      };
    };

    my.noctalia.monitors = {
      "eDP-1" = {
        width = 2256;
        height = 1504;
        scale = 1.5;

        showBar = true;
        showNotifications = true;
        showOSD = true;
      };
    };
  };
}
