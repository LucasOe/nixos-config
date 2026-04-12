{ ... }:

{
  programs.niri.settings = {
    window-rules = [
      # Floating Windows
      {
        matches = [ { app-id = ".float$"; } ];
        open-floating = true;
        default-column-width.proportion = 0.5;
        default-window-height.proportion = 0.75;
      }

      # Firefox Picture-in-Picture mode
      {
        matches = [
          {
            app-id = "^firefox";
            title = "^Picture-in-Picture$";
          }
        ];
        open-floating = true;
        open-focused = false;
        default-column-width.fixed = 480;
        default-window-height.fixed = 270;
        default-floating-position = {
          relative-to = "bottom-right";
          x = 32;
          y = 32;
        };
      }

      # Eyedropper
      {
        matches = [ { app-id = "eyedropper$"; } ];
        open-floating = true;
        open-focused = true;
        default-column-width.fixed = 480;
        default-window-height.fixed = 270;
        default-floating-position = {
          relative-to = "bottom-right";
          x = 32;
          y = 32;
        };
      }

      # Steam Windows
      {
        matches = [ { app-id = "^steam$"; } ];
        excludes = [ { title = "^Steam$"; } ];
        open-floating = true;
        default-column-width.fixed = 810;
        default-window-height.fixed = 1080;
      }

      # Games
      {
        matches = [
          { app-id = "^steam_app_.*$"; }
          { app-id = "^Minecraft"; }
        ];
        open-on-output = "DP-2";
        variable-refresh-rate = true;
      }
    ];
  };
}
