{ config, lib, ... }:

let
  cfg = config.my.niri;
in
{
  config = lib.mkIf (cfg.environment == "noctalia5") {
    wayland.windowManager.niri.settings = {
      window-rule = [
        # Floating Noctalia settings window
        {
          match = [ { _props.app-id = "dev.noctalia.Noctalia.Settings"; } ];
          open-floating = true;
          default-column-width.proportion = 0.5;
          default-window-height.proportion = 0.75;
        }
      ];

      binds = {
        # Volume Keys
        "XF86AudioRaiseVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "volume-up"
          ];
        };
        "XF86AudioLowerVolume" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "volume-down"
          ];
        };
        "XF86AudioMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "volume-mute"
          ];
        };
        "XF86AudioMicMute" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "mic-mute"
          ];
        };

        # Brightness
        "XF86MonBrightnessUp" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "brightnes-up"
          ];
        };
        "XF86MonBrightnessDown" = {
          _props.allow-when-locked = true;
          spawn = [
            "noctalia"
            "msg"
            "brightnes-down"
          ];
        };

        # Launcher
        "Mod+Control+Return" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "noctalia"
            "msg"
            "panel-toggle"
            "launcher"
          ];
        };
        "Mod+Space" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "noctalia"
            "msg"
            "panel-toggle"
            "launcher"
          ];
        };
        "Alt+Space" = {
          _props.hotkey-overlay-title = "Toggle Application Launcher";
          spawn = [
            "noctalia"
            "msg"
            "panel-toggle"
            "launcher"
          ];
        };
        "Mod+V" = {
          _props.hotkey-overlay-title = "Toggle Clipboard";
          spawn = [
            "noctalia"
            "msg"
            "panel-toggle"
            "clipboard"
          ];
        };

        # Lock Screen
        "Mod+Alt+L" = {
          _props.hotkey-overlay-title = "Toggle Lock Screen";
          spawn = [
            "noctalia"
            "msg"
            "screen-lock"
          ];
        };

        # Power Menu
        "Mod+X" = {
          _props.hotkey-overlay-title = "Toggle Power Menu";
          spawn = [
            "noctalia"
            "msg"
            "panel-toggle"
            "session"
          ];
        };
      };
    };
  };
}
