{ ... }:

{
  # https://niri-wm.github.io/niri/Configuration%3A-Window-Rules.html
  wayland.windowManager.niri.settings = {
    layer-rule = [
      # Put wallpaper inside the overview backdrop
      # https://niri-wm.github.io/niri/Overview.html#backdrop-customization
      {
        match = [ { _props.namespace = "^noctalia-wallpaper"; } ];
        place-within-backdrop = true;
      }

      # Disable xray on all Noctalia surfaces so it looks more realistic.
      # Noctalia publishes blur regions automatically when ext-background-effects is available.
      # https://docs.noctalia.dev/v5/compositor-settings/niri/?section=blur
      {
        match = [ { _props.namespace = "^noctalia-"; } ];
        background-effect.xray = false;
      }
    ];

    window-rule = [
      # Floating Windows
      {
        match = [ { _props.app-id = ".float$"; } ];
        open-floating = true;
        default-column-width.proportion = 0.5;
        default-window-height.proportion = 0.75;
      }

      # Firefox Picture-in-Picture mode
      {
        match = [
          {
            _props.app-id = "^firefox";
            _props.title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
        open-focused = false;
        default-column-width.fixed = 480;
        default-window-height.fixed = 270;
        default-floating-position = {
          _props.relative-to = "bottom-right";
          _props.x = 32;
          _props.y = 32;
        };
      }

      # Eyedropper
      {
        match = [ { _props.app-id = "eyedropper$"; } ];
        open-floating = true;
        open-focused = true;
        default-column-width.fixed = 480;
        default-window-height.fixed = 270;
        default-floating-position = {
          _props.relative-to = "bottom-right";
          _props.x = 32;
          _props.y = 32;
        };
      }

      # Steam Windows
      {
        match = [ { _props.app-id = "^steam$"; } ];
        exclude = [ { _props.title = "^Steam$"; } ];
        open-floating = true;
        default-column-width.fixed = 810;
        default-window-height.fixed = 1080;
      }

      # Steam Games
      # Note: this doesn't match games using gamescope
      {
        match = [
          { _props.app-id = "^steam_app_.*$"; }
          { _props.app-id = "\\.exe$"; }
        ];
        open-fullscreen = true;
        open-on-output = "DP-1";
        variable-refresh-rate = true;
      }
    ];
  };
}
