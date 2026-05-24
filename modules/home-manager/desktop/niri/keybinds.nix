{
  lib,
  pkgs,
  ...
}:

{
  # https://niri-wm.github.io/niri/Configuration%3A-Key-Bindings.html
  # List all available actions with 'niri msg action'
  # Shell specific keybinds are configure in the `dms` or `noctalia` modules
  wayland.windowManager.niri.settings.binds = {
    # Apps
    "Mod+B".spawn = "firefox-devedition";
    "Mod+E".spawn = "nautilus";
    "Mod+Shift+C".spawn = "eyedropper";

    # Terminal
    "Mod+Return".spawn = "ghostty";
    "Mod+T".spawn = "ghostty";
    "Mod+Shift+Return".spawn = [
      "ghostty"
      "--class=com.mitchellh.ghostty.float"
    ];
    "Mod+Shift+T".spawn = [
      "ghostty"
      "--class=com.mitchellh.ghostty.float"
    ];

    # General
    "Mod+C".center-column = [ ];
    "Mod+O" = {
      toggle-overview = [ ];
      _props.repeat = false;
    };
    "Mod+Q" = {
      close-window = [ ];
      _props.repeat = false;
    };
    "Mod+R".switch-preset-column-width = [ ];
    "Mod+Shift+Slash".show-hotkey-overlay = [ ];
    "Mod+Shift+Space".toggle-window-floating = [ ];
    "Mod+W".toggle-column-tabbed-display = [ ];

    # Fullscreen
    "Mod+F".maximize-column = [ ];
    "Mod+Shift+F".fullscreen-window = [ ];
    "Mod+Ctrl+F".expand-column-to-available-width = [ ];
    "Mod+M".maximize-window-to-edges = [ ];
    "Mod+Alt+F".toggle-windowed-fullscreen = [ ];

    # Columns
    "Mod+BracketLeft".consume-or-expel-window-left = [ ];
    "Mod+BracketRight".consume-or-expel-window-right = [ ];
    "Mod+Odiaeresis".consume-or-expel-window-left = [ ];
    "Mod+Adiaeresis".consume-or-expel-window-right = [ ];

    # Focusing and moving
    "Mod+Left".focus-column-left = [ ];
    "Mod+Right".focus-column-right = [ ];
    "Mod+Down".focus-window-down = [ ];
    "Mod+Up".focus-window-up = [ ];

    "Mod+Shift+Left".move-column-left = [ ];
    "Mod+Shift+Right".move-column-right = [ ];
    "Mod+Shift+Down".move-window-down-or-to-workspace-down = [ ];
    "Mod+Shift+Up".move-window-up-or-to-workspace-up = [ ];

    "Mod+WheelScrollRight".focus-column-right = [ ];
    "Mod+WheelScrollLeft".focus-column-left = [ ];

    # Monitors
    "Mod+Ctrl+Left".focus-monitor-left = [ ];
    "Mod+Ctrl+Right".focus-monitor-right = [ ];
    "Mod+Ctrl+Down".focus-monitor-down = [ ];
    "Mod+Ctrl+Up".focus-monitor-up = [ ];

    "Mod+Shift+Ctrl+Left".move-column-to-monitor-left = [ ];
    "Mod+Shift+Ctrl+Right".move-column-to-monitor-right = [ ];
    "Mod+Shift+Ctrl+Down".move-column-to-monitor-down = [ ];
    "Mod+Shift+Ctrl+Up".move-column-to-monitor-up = [ ];

    "Mod+Comma".focus-monitor-left = [ ];
    "Mod+Period".focus-monitor-right = [ ];

    "Mod+Shift+Comma".move-column-to-monitor-left = [ ];
    "Mod+Shift+Period".move-column-to-monitor-right = [ ];

    # Workspaces
    "Mod+Page_Down".focus-workspace-down = [ ];
    "Mod+Page_Up".focus-workspace-up = [ ];

    "Mod+Shift+Page_Down".move-column-to-workspace-down = [ ];
    "Mod+Shift+Page_Up".move-column-to-workspace-up = [ ];

    "Mod+Home".focus-column-first = [ ];
    "Mod+End".focus-column-last = [ ];

    "Mod+Ctrl+Home".move-column-to-first = [ ];
    "Mod+Ctrl+End".move-column-to-last = [ ];

    "Mod+1".focus-workspace = 1;
    "Mod+2".focus-workspace = 2;
    "Mod+3".focus-workspace = 3;
    "Mod+4".focus-workspace = 4;
    "Mod+5".focus-workspace = 5;
    "Mod+6".focus-workspace = 6;
    "Mod+7".focus-workspace = 7;
    "Mod+8".focus-workspace = 8;
    "Mod+9".focus-workspace = 9;

    "Mod+Shift+1".move-column-to-workspace = 1;
    "Mod+Shift+2".move-column-to-workspace = 2;
    "Mod+Shift+3".move-column-to-workspace = 3;
    "Mod+Shift+4".move-column-to-workspace = 4;
    "Mod+Shift+5".move-column-to-workspace = 5;
    "Mod+Shift+6".move-column-to-workspace = 6;
    "Mod+Shift+7".move-column-to-workspace = 7;
    "Mod+Shift+8".move-column-to-workspace = 8;
    "Mod+Shift+9".move-column-to-workspace = 9;

    # Screenshots
    "Mod+Print".screenshot = [ ];
    "Mod+Ctrl+Print".screenshot-screen = [ ];
    "Mod+Alt+Print".screenshot-window = [ ];

    # Screen mirroring
    # https://github.com/Ferdi265/wl-mirror/issues/59
    "Mod+Alt+P" = {
      _props.repeat = false;
      spawn-sh = "${lib.getExe' pkgs.wl-mirror "wl-mirror"} $(niri msg --json focused-output | ${lib.getExe pkgs.jq} -r .name)";
    };
  };
}
