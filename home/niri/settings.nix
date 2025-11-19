{ config, ... }:

{
  programs.niri = {
    # https://github.com/sodiboo/niri-flake/blob/main/docs.md
    # https://github.com/YaLTeR/niri/wiki/
    # https://github.com/YaLTeR/niri/blob/main/resources/default-config.kdl
    settings = {
      spawn-at-startup = [
        { command = [ "xwayland-satellite" ]; }
        { command = [ "noctalia-shell" ]; }
      ];

      prefer-no-csd = true;

      hotkey-overlay = {
        skip-at-startup = true;
      };

      layout = {
        background-color = "transparent";
        gaps = 10;

        focus-ring = {
          enable = true;
          width = 2;
          active.color = "#${config.lib.stylix.colors.base0B}";
          inactive.color = "#${config.lib.stylix.colors.base03}";
          urgent.color = "#${config.lib.stylix.colors.base0F}";
        };

        tab-indicator = {
          enable = true;
          gap = 2;
          corner-radius = 1;
          active.color = "#${config.lib.stylix.colors.base0B}";
          inactive.color = "#${config.lib.stylix.colors.base02}";
          urgent.color = "#${config.lib.stylix.colors.base0F}";
        };

        default-column-width = {
          proportion = 0.499;
        };

        preset-column-widths = [
          { proportion = 0.333; }
          { proportion = 0.499; }
          { proportion = 0.666; }
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
        GDK_BACKEND = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_DESKTOP = "niri";
        DISPLAY = ":0";
      };

      outputs = {
        # Laptop monitor
        "eDP-1" = {
          scale = 1.5;
        };
      };

      debug = {
        # Allows notification actions and window activation from Noctalia.
        honor-xdg-activation-with-invalid-serial = [ ];
      };
    };
  };
}
