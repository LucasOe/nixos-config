{ inputs, pkgs, ... }:

{
  imports = [ inputs.dms.homeModules.dank-material-shell ];

  # https://danklinux.com/docs/dankmaterialshell/nixos
  programs.dank-material-shell = {
    enable = true;
    dgop.package = inputs.dgop.packages.${pkgs.system}.default;

    # Core features
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = false; # Wallpaper-based theming (matugen)
    enableAudioWavelength = false; # Audio visualizer (cava)
    enableCalendarEvents = false; # Calendar integration (khal)
    enableClipboardPaste = true; # Pasting items from the clipboard (wtype)
  };

  wayland.windowManager.niri.settings = {
    environment = {
      DMS_DISABLE_MATUGEN = "1";
      DMS_DISABLE_CAVA = "1";
    };
  };

  stylix.targets.dank-material-shell = {
    enable = true;
  };
}
