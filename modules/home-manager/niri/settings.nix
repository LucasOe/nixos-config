{ config, lib, ... }:

let
  cfg = config.my.niri;
in
{
  # https://niri-wm.github.io/niri/Configuration%3A-Introduction.html
  wayland.windowManager.niri.settings = {
    spawn-sh-at-startup = [
      (lib.mkIf (cfg.environment == "dms") [ "dms run" ])
      (lib.mkIf (cfg.environment == "noctalia4") [ "noctalia-shell" ])
      (lib.mkIf (cfg.environment == "noctalia5") [ "noctalia" ])
    ];

    layout = {
      gaps = 10;
      center-focused-column = "never";
      empty-workspace-above-first = [ ];
      background-color = "transparent";

      shadow = {
        on = [ ];
        offset._props.x = 0;
        offset._props.y = 0;
        spread = 0;
        softness = 15;
      };

      focus-ring = {
        off = [ ];
      };

      border = {
        on = [ ];
        width = 2;
        active-color = config.lib.stylix.colors.withHashtag.base0B;
        inactive-color = config.lib.stylix.colors.withHashtag.base03;
        urgent-color = config.lib.stylix.colors.withHashtag.base0F;
      };

      tab-indicator = {
        on = [ ];
        gap = 2;
        corner-radius = 1;
        active-color = config.lib.stylix.colors.withHashtag.base0B;
        inactive-color = config.lib.stylix.colors.withHashtag.base02;
        urgent-color = config.lib.stylix.colors.withHashtag.base0F;
      };

      default-column-width.proportion = 0.500;

      preset-column-widths._children = [
        { proportion = 0.250; }
        { proportion = 0.333; }
        { proportion = 0.500; }
        { proportion = 0.666; }
        { proportion = 0.750; }
      ];
    };

    window-rule = [
      {
        geometry-corner-radius = 8.0;
        clip-to-geometry = true;
      }
    ];

    gestures.hot-corners.off = [ ];
    hotkey-overlay.skip-at-startup = [ ];
    clipboard.disable-primary = [ ];
    prefer-no-csd = [ ];
    overview.workspace-shadow.off = [ ];

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
}
