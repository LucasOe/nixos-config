{ config, lib, ... }:

let
  cfg = config.my.niri;
in
{
  config = lib.mkIf (cfg.environment == "dms") {
    wayland.windowManager.niri.settings = {
      # Files under `$XDG_CONFIG_HOME/niri/dms` to be included into the new config
      # includes = lib.mkAfter [
      #   "dms/alttab.kdl"
      #   "dms/binds.kdl"
      #   "dms/colors.kdl"
      #   "dms/cursor.kdl"
      #   "dms/layout.kdl"
      #   "dms/outputs.kdl"
      #   "dms/wpblur.kdl"
      # ];

      # Keybinds for Niri
      binds = {
        # Media Keys
        "XF86AudioPlay" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "mpris"
            "playPause"
          ];
        };
        "XF86AudioStop" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "mpris"
            "stop"
          ];
        };
        "XF86AudioPrev" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "mpris"
            "previous"
          ];
        };
        "XF86AudioNext" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "mpris"
            "next"
          ];
        };

        # Volume Keys
        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "audio"
            "increment"
            "5"
          ];
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "audio"
            "decrement"
            "5"
          ];
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "audio"
            "mute"
          ];
        };
        "XF86AudioMicMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "audio"
            "micmute"
          ];
        };

        # Brightness
        "XF86MonBrightnessUp" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "brightness"
            "increment"
            "5"
            ""
          ];
        };
        "XF86MonBrightnessDown" = {
          _props.allow-when-locked = true;
          spawn = [
            "dms"
            "ipc"
            "brightness"
            "decrement"
            "5"
            ""
          ];
        };

        # Launcher
        "Mod+Control+Return" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "dms"
            "ipc"
            "spotlight"
            "toggle"
          ];
        };
        "Mod+Space" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "dms"
            "ipc"
            "spotlight"
            "toggle"
          ];
        };
        "Alt+Space" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "dms"
            "ipc"
            "spotlight"
            "toggle"
          ];
        };

        # Clipboard
        "Mod+V" = {
          _props.hotkey-overlay-title = "Toggle Clipboard Manager";
          spawn = [
            "dms"
            "ipc"
            "clipboard"
            "toggle"
          ];
        };

        # Notifications
        "Mod+N" = {
          _props.hotkey-overlay-title = "Toggle Notification Center";
          spawn = [
            "dms"
            "ipc"
            "notifications"
            "toggle"
          ];
        };

        # Lock Screen
        "Super+Alt+L" = {
          _props.hotkey-overlay-title = "Toggle Lock Screen";
          spawn = [
            "dms"
            "ipc"
            "lock"
            "lock"
          ];
        };

        # Power Menu
        "Mod+X" = {
          _props.hotkey-overlay-title = "Toggle Power Menu";
          spawn = [
            "dms"
            "ipc"
            "powermenu"
            "toggle"
          ];
        };

        # Notepad
        "Mod+P" = {
          _props.hotkey-overlay-title = "Toggle Notepad";
          spawn = [
            "dms"
            "ipc"
            "notepad"
            "toggle"
          ];
        };
      };
    };
  };
}
