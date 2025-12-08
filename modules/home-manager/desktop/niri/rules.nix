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
      {
        matches = [
          {
            app-id = "firefox$";
            title = "^Picture-in-Picture$";
          }
          {
            app-id = "eyedropper$";
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
      {
        matches = [
          {
            app-id = "firefox$";
          }
        ];
        open-maximized = true;
      }
    ];
  };
}
