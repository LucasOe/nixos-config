{ config, pkgs, ... }:

let
  apps = import ./applications.nix { inherit pkgs; };
in
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      playerctl = "${pkgs.playerctl}/bin/playerctl";

      # Media Key Actions
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

      # Windows
      "super+q".action = close-window;
      "super+o".action = toggle-overview;
      "super+b".action = spawn apps.firefox;
      "super+t".action = spawn apps.kitty;
      "super+Return".action = spawn apps.kitty;

      "super+f".action = maximize-column;
      "super+shift+f".action = fullscreen-window;

      "super+Left".action = focus-column-left;
      "super+Right".action = focus-column-right;
      "super+Down".action = focus-workspace-down;
      "super+Up".action = focus-workspace-up;

      "super+Shift+Left".action = move-column-left;
      "super+Shift+Right".action = move-column-right;
      "super+Shift+Down".action = move-column-to-workspace-down;
      "super+Shift+Up".action = move-column-to-workspace-up;
    };
}
