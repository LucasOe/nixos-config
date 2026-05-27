{ ... }:

{
  # https://niri-wm.github.io/niri/Configuration%3A-Window-Rules.html
  wayland.windowManager.niri.settings = {
    layer-rule = [
      # Put wallpaper inside the overview backdrop
      # https://niri-wm.github.io/niri/Overview.html#backdrop-customization
      {
        match = [
          { _props.namespace = "^dms:blurwallpaper"; }
          { _props.namespace = "^noctalia-wallpaper"; }
          { _props.namespace = "^quickshell$"; }
          { _props.namespace = "^wpaperd"; }
        ];
        place-within-backdrop = true;
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

      # Games
      {
        match = [
          { _props.app-id = "^steam_app_.*$"; }
          { _props.app-id = "^Minecraft"; }
        ];
        open-on-output = "DP-2";
        variable-refresh-rate = true;
      }
    ];
  };
}
