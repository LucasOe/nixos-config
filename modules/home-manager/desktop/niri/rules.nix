{ ... }:

{
  programs.niri.settings = {
    window-rules = [
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
        default-column-width = {
          fixed = 480;
        };
        default-window-height = {
          fixed = 270;
        };
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
      }

      # Eyedropper
      {
        matches = [ { app-id = "eyedropper$"; } ];
        open-floating = true;
        open-focused = true;
        default-column-width = {
          fixed = 480;
        };
        default-window-height = {
          fixed = 270;
        };
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
      }

      # Steam Windows
      {
        matches = [ { app-id = "^steam$"; } ];
        excludes = [ { title = "^Steam$"; } ];
        open-floating = true;
        default-column-width = {
          fixed = 810;
        };
        default-window-height = {
          fixed = 1080;
        };
      }

      # Games
      {
        matches = [
          { app-id = "^gamescope$"; }
          { app-id = "^steam_app_.*$"; }
          { app-id = "^steam_proton$"; }
          { app-id = "^Minecraft"; }
          { app-id = "^blackdesert64.exe$"; }
        ];
        open-on-output = "DP-2";
        variable-refresh-rate = true;
      }
    ];
  };
}
