{ config, ... }:

{
  # Shell specific keybinds are configure in the `dms` or `noctalia` modules
  programs.niri.settings.binds = with config.lib.niri.actions; {
    # Apps
    "Mod+B".action = spawn "firefox-devedition";
    "Mod+T".action = spawn "ghostty";
    "Mod+Return".action = spawn "ghostty";
    "Mod+E".action = spawn "nautilus";
    "Mod+Shift+C".action = spawn "eyedropper";

    # General
    "Mod+Q".action = close-window;
    "Mod+O".action = toggle-overview;
    "Mod+R".action = switch-preset-column-width;
    "Mod+W".action = toggle-column-tabbed-display;
    "Mod+C".action = center-column;

    # Fullscreen
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+Ctrl+F".action = expand-column-to-available-width;

    # Columns
    "Mod+BracketLeft".action = consume-or-expel-window-left;
    "Mod+BracketRight".action = consume-or-expel-window-right;
    "Mod+Odiaeresis".action = consume-or-expel-window-left;
    "Mod+Adiaeresis".action = consume-or-expel-window-right;

    # Focusing and moving
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-window-down;
    "Mod+Up".action = focus-window-up;

    "Mod+Shift+Left".action = move-column-left;
    "Mod+Shift+Right".action = move-column-right;
    "Mod+Shift+Down".action = move-column-to-workspace-down;
    "Mod+Shift+Up".action = move-column-to-workspace-up;

    "Mod+WheelScrollRight".action = focus-column-right;
    "Mod+WheelScrollLeft".action = focus-column-left;

    # Monitors
    "Mod+Ctrl+Left".action = focus-monitor-left;
    "Mod+Ctrl+Right".action = focus-monitor-right;
    "Mod+Ctrl+Down".action = focus-monitor-down;
    "Mod+Ctrl+Up".action = focus-monitor-up;

    "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
    "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
    "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
    "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;

    "Mod+Comma".action = focus-monitor-left;
    "Mod+Period".action = focus-monitor-right;

    "Mod+Shift+Comma".action = move-column-to-monitor-left;
    "Mod+Shift+Period".action = move-column-to-monitor-right;

    # Workspaces
    "Mod+Page_Down".action = focus-workspace-down;
    "Mod+Page_Up".action = focus-workspace-up;

    "Mod+Shift+Page_Down".action = move-column-to-workspace-down;
    "Mod+Shift+Page_Up".action = move-column-to-workspace-up;

    "Mod+Home".action = focus-column-first;
    "Mod+End".action = focus-column-last;

    "Mod+Ctrl+Home".action = move-column-to-first;
    "Mod+Ctrl+End".action = move-column-to-last;

    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;

    # "Mod+Shift+1".action = move-column-to-workspace 1;
    # "Mod+Shift+2".action = move-column-to-workspace 2;
    # "Mod+Shift+3".action = move-column-to-workspace 3;
    # "Mod+Shift+4".action = move-column-to-workspace 4;
    # "Mod+Shift+5".action = move-column-to-workspace 5;
    # "Mod+Shift+6".action = move-column-to-workspace 6;
    # "Mod+Shift+7".action = move-column-to-workspace 7;
    # "Mod+Shift+8".action = move-column-to-workspace 8;
    # "Mod+Shift+9".action = move-column-to-workspace 9;

    # Screenshots
    "Mod+Print".action.screenshot = {
      show-pointer = false;
    };
    "Mod+Alt+Print".action.screenshot-window = {
      write-to-disk = true;
    };
  };
}
