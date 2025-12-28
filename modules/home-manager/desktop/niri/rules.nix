{ ... }:

{
  programs.niri.settings = {
    layer-rules = [
      {
        matches = [
          {
            namespace = "^quickshell$";
          }
          {
            namespace = "dms:blurwallpaper";
          }
          {
            namespace = "^noctalia-overview*";
          }
        ];
        place-within-backdrop = true;
      }
    ];
    window-rules = [
      # Firefox Picture-in-Picture mode
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
          {
            app-id = "firefox-devedition$";
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
        matches = [
          {
            app-id = "eyedropper$";
          }
        ];
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
      # Black Desert
      {
        matches = [
          {
            app-id = "^blackdesert64.exe$";
          }
        ];
        open-on-output = "DP-2";
      }
    ];
  };
}
