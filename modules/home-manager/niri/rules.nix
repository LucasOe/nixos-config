{ ... }:

{
  # https://niri-wm.github.io/niri/Configuration%3A-Window-Rules.html
  wayland.windowManager.niri.settings = {
    _children = [
      # Put wallpaper inside the overview backdrop
      # https://niri-wm.github.io/niri/Overview.html#backdrop-customization
      {
        layer-rule._children = [
          { match._props.namespace = "^noctalia-wallpaper"; }
          { place-within-backdrop = true; }
        ];
      }

      # Disable xray on all Noctalia surfaces so it looks more realistic.
      # Noctalia publishes blur regions automatically when ext-background-effects is available.
      # https://docs.noctalia.dev/v5/compositor-settings/niri/?section=blur
      {
        layer-rule._children = [
          { match._props.namespace = "^noctalia-"; }
          { background-effect.xray = false; }
        ];
      }

      # Floating Windows
      {
        window-rule._children = [
          { match._props.app-id = ".float$"; }
          { open-floating = true; }
          { default-column-width.proportion = 0.5; }
          { default-window-height.proportion = 0.75; }
        ];
      }

      # Firefox Picture-in-Picture mode
      {
        window-rule._children = [
          {
            match._props = {
              app-id = "^firefox";
              title = "^Picture-in-Picture$";
            };
          }
          { open-floating = true; }
          { open-focused = false; }
          { default-column-width.fixed = 480; }
          { default-window-height.fixed = 270; }
          {
            default-floating-position._props = {
              relative-to = "bottom-right";
              x = 32;
              y = 32;
            };
          }
        ];
      }

      # Eyedropper
      {
        window-rule._children = [
          { match._props.app-id = "eyedropper$"; }
          { open-floating = true; }
          { open-focused = true; }
          { default-column-width.fixed = 480; }
          { default-window-height.fixed = 270; }
          {
            default-floating-position._props = {
              relative-to = "bottom-right";
              x = 32;
              y = 32;
            };
          }
        ];
      }

      # Steam Windows
      {
        window-rule._children = [
          { match._props.app-id = "^steam$"; }
          { exclude._props.title = "^Steam$"; }
          { open-floating = true; }
          { default-column-width.fixed = 810; }
          { default-window-height.fixed = 1080; }
        ];
      }

      # Steam Games
      {
        window-rule._children = [
          { match._props.app-id = "^steam_app_.*$"; }
          { match._props.app-id = "\.exe$"; }
          { force-render = true; } # Requires https://github.com/niri-wm/niri/pull/2609
          { open-fullscreen = true; }
          { open-on-output = "DP-1"; }
          { variable-refresh-rate = true; }
        ];
      }

      # Fullscreen Applications
      {
        window-rule._children = [
          { match._props.is-fullscreen = true; } # Requires https://github.com/niri-wm/niri/pull/4064
          { exclude._props.app-id = "^firefox"; }
          { variable-refresh-rate = true; }
          { force-render = true; } # Requires https://github.com/niri-wm/niri/pull/2609
        ];
      }
    ];
  };
}
