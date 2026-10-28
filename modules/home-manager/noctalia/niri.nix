{ ... }:

{
  wayland.windowManager.niri.settings = {
    binds = {
      # Media Keys
      "XF86AudioPlay" = {
        _props.allow-when-locked = true;
        spawn = [
          "noctalia"
          "msg"
          "media"
          "toggle"
        ];
      };
      "XF86AudioStop" = {
        _props.allow-when-locked = true;
        spawn = [
          "noctalia"
          "msg"
          "media"
          "stop"
        ];
      };
      "XF86AudioPrev" = {
        _props.allow-when-locked = true;
        spawn = [
          "noctalia"
          "msg"
          "media"
          "previous"
        ];
      };
      "XF86AudioNext" = {
        _props.allow-when-locked = true;
        spawn = [
          "noctalia"
          "msg"
          "media"
          "next"
        ];
      };

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
          "brightness-up"
        ];
      };
      "XF86MonBrightnessDown" = {
        _props.allow-when-locked = true;
        spawn = [
          "noctalia"
          "msg"
          "brightness-down"
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
          "session"
          "lock"
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

      # Window Switcher
      "Alt+Tab" = {
        _props.hotkey-overlay-title = "Toggle Window Switcher";
        spawn = [
          "noctalia"
          "msg"
          "window-switcher"
          "hold"
        ];
      };

      # Screenshot
      "Mod+BackSpace" = {
        _props.hotkey-overlay-title = "Annotate Screen";
        spawn = [
          "noctalia"
          "msg"
          "annotate"
        ];
      };
      "Mod+Print" = {
        _props.hotkey-overlay-title = "Screenshot Region";
        spawn = [
          "noctalia"
          "msg"
          "screenshot-region"
        ];
      };
      "Mod+Ctrl+Print" = {
        _props.hotkey-overlay-title = "Screenshot Screen";
        spawn = [
          "noctalia"
          "msg"
          "screenshot-fullscreen"
        ];
      };
      # Requires: https://github.com/niri-wm/niri/pull/4599
      "Mod+Shift+Print" = {
        _props.hotkey-overlay-title = "Screenshot Window";
        spawn = [
          "noctalia"
          "msg"
          "screenshot-window"
        ];
      };
    };
  };
}
