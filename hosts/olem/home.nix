{ username, ... }:

{
  home-manager.users.${username} = {
    my.monitors = {
      "eDP-1" = {
        niri = {
          scale = 1.5;
        };
      };
    };
  };
}
