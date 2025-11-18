{ ... }:

{
  programs.niri = {
    # https://github.com/sodiboo/niri-flake/blob/main/docs.md
    # https://github.com/YaLTeR/niri/wiki/
    # https://github.com/YaLTeR/niri/blob/main/resources/default-config.kdl
    settings = {
      prefer-no-csd = true;

      hotkey-overlay = {
        skip-at-startup = true;
      };

      layout = {
        background-color = "transparent";

        focus-ring = {
          enable = true;
          width = 2;
          active = {
            color = "#98c379";
          };
          inactive = {
            color = "#282c34";
          };
        };

        gaps = 10;

        default-column-width = {
          proportion = 1. / 2.;
        };

        preset-column-widths = [
          { proportion = 1. / 3.; }
          { proportion = 1. / 2.; }
          { proportion = 2. / 3.; }
        ];
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
          geometry-corner-radius = {
            bottom-left = 8.0;
            bottom-right = 8.0;
            top-left = 8.0;
            top-right = 8.0;
          };

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
