{ ... }:

{
  programs.niri = {
    # https://github.com/sodiboo/niri-flake/blob/main/docs.md
    # https://github.com/YaLTeR/niri/wiki/
    settings = {
      prefer-no-csd = true;

      hotkey-overlay = {
        skip-at-startup = true;
      };

      layout = {
        background-color = "transparent";
        # background-color = "#21252b";

        focus-ring = {
          enable = true;
          width = 3;
          active = {
            color = "#98c379";
          };
          inactive = {
            color = "#282c34";
          };
        };

        gaps = 10;

        struts = {
          left = 0;
          right = 0;
          top = 0;
          bottom = 0;
        };
      };

      input = {
        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
        };
        focus-follows-mouse.enable = true;
        warp-mouse-to-focus.enable = false;
      };

      window-rules = [
        {
          geometry-corner-radius.bottom-left = 12.0;
          geometry-corner-radius.bottom-right = 12.0;
          geometry-corner-radius.top-left = 12.0;
          geometry-corner-radius.top-right = 12.0;
          clip-to-geometry = true;
        }
      ];

      gestures = {
        hot-corners.enable = false;
      };

      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";
        DISPLAY = ":0";
      };

      debug = {
        # Allows notification actions and window activation from Noctalia.
        honor-xdg-activation-with-invalid-serial = [ ];
      };
    };
  };
}
