{ config, ... }:

{
  # Keybinds for Niri
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      dms-ipc = spawn "dms" "ipc" "call";
    in
    {
      # Media Keys
      "XF86AudioPlay" = {
        action = dms-ipc "mpris" "playPause";
        hotkey-overlay.title = "Start playback";
      };
      "XF86AudioStop" = {
        action = dms-ipc "mpris" "stop";
        hotkey-overlay.title = "Stop playback";
      };
      "XF86AudioPrev" = {
        action = dms-ipc "mpris" "previous";
        hotkey-overlay.title = "Skip to previous track";
      };
      "XF86AudioNext" = {
        action = dms-ipc "mpris" "next";
        hotkey-overlay.title = "Skip to next track";
      };

      # Launcher
      "Mod+Control+Return" = {
        action = dms-ipc "spotlight" "toggle";
        hotkey-overlay.title = "Toggle Application Launcher";
      };
      "Mod+Space" = {
        action = dms-ipc "spotlight" "toggle";
        hotkey-overlay.title = "Toggle Application Launcher";
      };
      "Alt+Space" = {
        action = dms-ipc "spotlight" "toggle";
        hotkey-overlay.title = "Toggle Application Launcher";
      };

      # Notifications
      "Mod+N" = {
        action = dms-ipc "notifications" "toggle";
        hotkey-overlay.title = "Toggle Notification Center";
      };

      # Lock Screen
      "Super+Alt+L" = {
        action = dms-ipc "lock" "lock";
        hotkey-overlay.title = "Toggle Lock Screen";
      };

      # Power Menu
      "Mod+X" = {
        action = dms-ipc "powermenu" "toggle";
        hotkey-overlay.title = "Toggle Power Menu";
      };

      # Volume Keys
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action = dms-ipc "audio" "increment" "3";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action = dms-ipc "audio" "decrement" "3";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action = dms-ipc "audio" "mute";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action = dms-ipc "audio" "micmute";
      };

      # Brightness
      "XF86MonBrightnessUp" = {
        action = dms-ipc "brightness" "increment" "5" "";
        hotkey-overlay.title = "Increase brightness";
      };
      "XF86MonBrightnessDown" = {
        action = dms-ipc "brightness" "decrement" "5" "";
        hotkey-overlay.title = "Decrease brightness";
      };

      # Notepad
      "Mod+P" = {
        action = dms-ipc "notepad" "toggle";
        hotkey-overlay.title = "Toggle Notepad";
      };
    };
}
