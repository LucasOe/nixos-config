{ config, pkgs, ... }:

{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      wpctl = "${pkgs.wireplumber}/bin/wpctl";
      brightnessctl = "${pkgs.brightnessctl}/bin/brightnessctl";

      # Volume Key Actions
      volume-up = spawn wpctl [
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "+5%"
      ];
      volume-down = spawn wpctl [
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "-5%"
      ];
      audio-mute = spawn wpctl [
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ];
      audio-mic-mute = spawn wpctl [
        "set-mute"
        "@DEFAULT_AUDIO_SINK_SOURCE@"
        "toggle"
      ];

      # Brightness Key Actions
      brightness-up = spawn brightnessctl [
        "--class=backlight"
        "set"
        "+10%"
      ];
      brightness-down = spawn brightnessctl [
        "--class=backlight"
        "set"
        "10%-"
      ];
    in
    {
      # Quickshell Keybinds Start
      "super+Control+Return".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
      "super+Space".action = spawn [
        "noctalia-shell"
        "ipc"
        "call"
        "launcher"
        "toggle"
      ];
      # Quickshell Keybinds End

      # Volume Keys
      "XF86AudioRaiseVolume".action = volume-up;
      "XF86AudioLowerVolume".action = volume-down;
      "XF86AudioMute".action = audio-mute;
      "XF86AudioMicMute".action = audio-mic-mute;

      # Brightness
      "XF86MonBrightnessUp".action = brightness-up;
      "XF86MonBrightnessDown".action = brightness-down;
    };
}
