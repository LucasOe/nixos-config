{ config, pkgs, ... }:

{
  # Autostart
  programs.niri.settings.spawn-at-startup = [
    { command = [ "noctalia-shell" ]; }
  ];

  # Keybinds for Niri
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      # noctalia-shell doesn't have a media interface
      playerctl = "${pkgs.playerctl}/bin/playerctl";

      media-play-pause = spawn playerctl [ "play-pause" ];
      media-stop = spawn playerctl [ "stop" ];
      media-next = spawn playerctl [ "next" ];
      media-previous = spawn playerctl [ "previous" ];
    in
    {
      # Media Keys
      "XF86AudioPlay".action = media-play-pause;
      "XF86AudioStop".action = media-stop;
      "XF86AudioPrev".action = media-previous;
      "XF86AudioNext".action = media-next;

      # Launcher
      "Mod+Control+Return".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
      "Mod+Space".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];

      # Clipboard Manager
      "Mod+V".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "clipboard"
      ];

      # Notifications
      "Mod+N".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "notifications"
        "toggleHistory"
      ];

      # Settings
      "Mod+I".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "settings"
        "toggle"
      ];

      # Lock Screen
      "Mod+Alt+L".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "lockScreen"
        "lock"
      ];

      # Power Menu
      "Mod+X".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "sessionMenu"
        "toggle"
      ];

      # Volume Keys
      "XF86AudioRaiseVolume".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "volume"
        "increase"
      ];
      "XF86AudioLowerVolume".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "volume"
        "decrease"
      ];
      "XF86AudioMute".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "volume"
        "muteOutput"
      ];
      "XF86AudioMicMute".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "volume"
        "muteInput"
      ];

      # Brightness
      "XF86MonBrightnessUp".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "brightness"
        "increase"
      ];
      "XF86MonBrightnessDown".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "brightness"
        "decrease"
      ];
    };
}
