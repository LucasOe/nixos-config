{ config, ... }:

{
  # Keybinds for Niri
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      noctalia-ipc = spawn "noctalia-shell" "ipc" "call";
    in
    {
      # Media Keys
      "XF86AudioPlay" = {
        action = noctalia-ipc "media" "play";
        hotkey-overlay.title = "Start playback";
      };
      "XF86AudioStop" = {
        action = noctalia-ipc "media" "pause";
        hotkey-overlay.title = "Stop playback";
      };
      "XF86AudioPrev" = {
        action = noctalia-ipc "media" "previous";
        hotkey-overlay.title = "Skip to previous track";
      };
      "XF86AudioNext" = {
        action = noctalia-ipc "media" "next";
        hotkey-overlay.title = "Skip to next track";
      };

      # Launcher
      "Mod+Control+Return" = {
        action = noctalia-ipc "launcher" "toggle";
        hotkey-overlay.title = "Toggle Application Launcher";
      };
      "Mod+Space" = {
        action = noctalia-ipc "launcher" "toggle";
        hotkey-overlay.title = "Toggle Application Launcher";
      };
      "Alt+Space" = {
        action = noctalia-ipc "launcher" "toggle";
        hotkey-overlay.title = "Toggle Application Launcher";
      };
      "Mod+V" = {
        action = noctalia-ipc "launcher" "clipboard";
        hotkey-overlay.title = "Toggle Clipboard";
      };

      # Notifications
      "Mod+N" = {
        action = noctalia-ipc "notifications" "toggleHistory";
        hotkey-overlay.title = "Toggle Notification Center";
      };

      # Lock Screen
      "Mod+Alt+L" = {
        action = noctalia-ipc "lockScreen" "lock";
        hotkey-overlay.title = "Toggle Lock Screen";
      };

      # Power Menu
      "Mod+X" = {
        action = noctalia-ipc "sessionMenu" "toggle";
        hotkey-overlay.title = "Toggle Power Menu";
      };

      # Volume Keys
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action = noctalia-ipc "volume" "increase";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action = noctalia-ipc "volume" "decrease";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action = noctalia-ipc "volume" "muteOutput";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action = noctalia-ipc "volume" "muteInput";
      };

      # Brightness
      "XF86MonBrightnessUp" = {
        action = noctalia-ipc "brightness" "increase";
        hotkey-overlay.title = "Increase brightness";
      };
      "XF86MonBrightnessDown" = {
        action = noctalia-ipc "brightness" "decrease";
        hotkey-overlay.title = "Decrease brightness";
      };
    };
}
