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

      layout = {
        gaps = 10;
        center-focused-column = "never";
        empty-workspace-above-first = true;
        background-color = "transparent";

        shadow = {
          enable = true;
          offset.x = 0;
          offset.y = 0;
          spread = 0;
          softness = 15;
        };

        focus-ring.enable = false;
        border = {
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

        default-column-width.proportion = 0.500;

        preset-column-widths = [
          { proportion = 0.250; }
          { proportion = 0.333; }
          { proportion = 0.500; }
          { proportion = 0.666; }
          { proportion = 0.750; }
        ];
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

      gestures.hot-corners = {
        top-left = false;
        top-right = false;
        bottom-left = false;
        bottom-right = false;
      };

      hotkey-overlay = {
        skip-at-startup = true;
      };

      clipboard.disable-primary = true;
      prefer-no-csd = true;

      environment = {
        CLUTTER_BACKEND = "wayland";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        GDK_BACKEND = "wayland";
        GSK_RENDERER = "ngl";
        MOZ_ENABLE_WAYLAND = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        XDG_CURRENT_DESKTOP = "niri";
        XDG_SESSION_DESKTOP = "niri";
        XDG_SESSION_TYPE = "wayland";
      };

      debug = {
        # Allows notification actions and window activation from Noctalia.
        honor-xdg-activation-with-invalid-serial = [ ];
      };
    };
  };
}
