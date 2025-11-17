{ config, pkgs, ... }:

{
  # Keybinds for Niri
  # Most keybinds are already handled by DMS when `programs.dankMaterialShell.niri.enableKeybinds` is enabled.
  programs.niri.settings.binds = with config.lib.niri.actions; {
    # Media Keys
    "XF86AudioPlay".action = spawn [
      "dms"
      "ipc"
      "call"
      "mpris"
      "playPause"
    ];
    "XF86AudioStop".action = spawn [
      "dms"
      "ipc"
      "call"
      "mpris"
      "stop"
    ];
    "XF86AudioPrev".action = spawn [
      "dms"
      "ipc"
      "call"
      "mpris"
      "previous"
    ];
    "XF86AudioNext".action = spawn [
      "dms"
      "ipc"
      "call"
      "mpris"
      "next"
    ];
  };
}
