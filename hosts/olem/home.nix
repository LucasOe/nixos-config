{ username, ... }:

{
  home-manager.users.${username} = {
    my.niri.monitors = {
      "eDP-1" = {
        scale = 1.5;
      };
    };
  };
}
