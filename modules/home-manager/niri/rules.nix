{ ... }:

{
  # https://niri-wm.github.io/niri/Configuration%3A-Window-Rules.html
  wayland.windowManager.niri.settings = {
    _children = [
      # Put wallpaper inside the overview backdrop.
      # https://niri-wm.github.io/niri/Overview.html#backdrop-customization
      {
        layer-rule = {
          match._props.namespace = "^noctalia-wallpaper";
          place-within-backdrop = true;
        };
      }

      # Disable xray on all Noctalia surfaces so it looks more realistic.
      # Noctalia publishes blur regions automatically when ext-background-effects is available.
      # https://docs.noctalia.dev/v5/compositor-settings/niri/?section=blur
      {
        layer-rule = {
          match._props.namespace = "^noctalia-";
          background-effect.xray = false;
        };
      }

      # Enable blur on Noctalia's window switcher
      {
        layer-rule = {
          match._props.namespace = "^noctalia-window-switcher$";
          background-effect.blur = true;
        };
      }

      # Floating Windows
      {
        window-rule = {
          match._props.app-id = ".float$";
          open-floating = true;
          default-column-width.proportion = 0.5;
          default-window-height.proportion = 0.75;
        };
      }

      # Firefox Picture-in-Picture mode
      {
        window-rule = {
          match._props = {
            app-id = "^firefox";
            title = "^Picture-in-Picture$";
          };
          open-floating = true;
          open-focused = false;
          default-column-width.fixed = 480;
          default-window-height.fixed = 270;
          default-floating-position._props = {
            relative-to = "bottom-right";
            x = 32;
            y = 32;
          };
        };
      }

      # Eyedropper
      {
        window-rule = {
          match._props.app-id = "eyedropper$";
          open-floating = true;
          open-focused = true;
          default-column-width.fixed = 480;
          default-window-height.fixed = 270;
          default-floating-position._props = {
            relative-to = "bottom-right";
            x = 32;
            y = 32;
          };
        };
      }

      # Steam Windows
      {
        window-rule = {
          match._props.app-id = "^steam$";
          exclude._props.title = "^Steam$";
          open-floating = true;
          default-column-width.fixed = 810;
          default-window-height.fixed = 1080;
        };
      }

      # Enable on-demand VRR when any window is fullscreen.
      # Exclude Firefox to avoid flickering when watching videos in fullscreen.
      # Requires niri-unstable:
      # https://github.com/niri-wm/niri/commit/83193223171fb55f5bfceaa2fe9aaf6cf6159684
      {
        window-rule = {
          exclude._props.app-id = "^firefox";
          variable-refresh-rate = "fullscreen-only";
        };
      }

      # Black Desert
      # Requires force-render patch:
      # https://github.com/niri-wm/niri/pull/4392
      {
        window-rule = {
          _children = [
            { match._props.app-id = "^blackdesert64.exe$"; }
            { match._props.app-id = "^blackdesertpatcher32.pae$"; }
          ];
          open-on-output = "DP-1";
          force-render = 30;
        };
      }
    ];
  };
}
