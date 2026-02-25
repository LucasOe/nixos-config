{ inputs, ... }:

{
  imports = [
    inputs.dms.homeModules.dank-material-shell
    ./settings.nix
    ./niri.nix
  ];

  # https://danklinux.com/docs/dankmaterialshell/nixos
  programs.dank-material-shell = {
    enable = true;

    systemd = {
      enable = true; # Systemd service for auto-start
      restartIfChanged = true; # Auto-restart dms.service when dankMaterialShell changes
    };

    # Core Featues
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableVPN = true; # VPN management widget
    enableDynamicTheming = false; # Wallpaper-based theming (matugen)
    enableAudioWavelength = false; # Audio visualizer (cava)
    enableCalendarEvents = false; # Calendar integration (khal)
    enableClipboardPaste = true; # Pasting items from the clipboard (wtype)
  };

  stylix.targets.dank-material-shell = {
    enable = true;
  };
}
