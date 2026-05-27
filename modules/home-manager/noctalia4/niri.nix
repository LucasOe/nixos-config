{ config, lib, ... }:

let
  cfg = config.my.niri;
in
{
  config = lib.mkIf (cfg.environment == "noctalia4") {
    wayland.windowManager.niri.settings = {
      # Keybinds for Niri
      binds = {
        # Media Keys
        "XF86AudioPlay" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "media"
            "play"
          ];
        };
        "XF86AudioStop" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "media"
            "pause"
          ];
        };
        "XF86AudioPrev" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "media"
            "previous"
          ];
        };
        "XF86AudioNext" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "media"
            "next"
          ];
        };

        # Volume Keys
        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "volume"
            "increase"
          ];
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "volume"
            "decrease"
          ];
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "volume"
            "muteOutput"
          ];
        };
        "XF86AudioMicMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "volume"
            "muteInput"
          ];
        };

        # Brightness
        "XF86MonBrightnessUp" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "brightness"
            "increase"
          ];
        };
        "XF86MonBrightnessDown" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "brightness"
            "decrease"
          ];
        };

        # Launcher
        "Mod+Control+Return" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "launcher"
            "toggle"
          ];
        };
        "Mod+Space" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "launcher"
            "toggle"
          ];
        };
        "Alt+Space" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "launcher"
            "toggle"
          ];
        };
        "Mod+V" = {
          _props.hotkey-overlay-title = "Toggle Clipboard";
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "launcher"
            "clipboard"
          ];
        };

        # Notifications
        "Mod+N" = {
          _props.hotkey-overlay-title = "Toggle Notification Center";
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "notifications"
            "toggleHistory"
          ];
        };

        # Lock Screen
        "Mod+Alt+L" = {
          _props.hotkey-overlay-title = "Toggle Lock Screen";
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "lockScreen"
            "lock"
          ];
        };

        # Power Menu
        "Mod+X" = {
          _props.hotkey-overlay-title = "Toggle Power Menu";
          spawn = [
            "noctalia-shell"
            "ipc"
            "call"
            "sessionMenu"
            "toggle"
          ];
        };
      };
    };
  };
}
