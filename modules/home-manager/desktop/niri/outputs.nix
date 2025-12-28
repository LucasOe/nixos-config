{ ... }:

{
  programs.niri.settings = {
    outputs = {
      # Laptop monitor
      "eDP-1" = {
        scale = 1.5;
      };
      # Desktop secondary vertical monitor
      "DP-1" = {
        transform.rotation = 270;
        position.x = 3440;
        position.y = 0;
        mode.width = 2560;
        mode.height = 1440;
        mode.refresh = 144.0;
        variable-refresh-rate = true;

        # https://github.com/sodiboo/niri-flake/issues/1404
        # layout = {
        #   default-column-width.proportion = 1.0;
        #   preset-column-widths = [ ];
        # };
      };
      # Desktop primary monitor
      "DP-2" = {
        position.x = 0;
        position.y = 560;
        mode.width = 3440;
        mode.height = 1440;
        mode.refresh = 143.923;
        variable-refresh-rate = true;
        focus-at-startup = true;
      };
    };
  };
}
