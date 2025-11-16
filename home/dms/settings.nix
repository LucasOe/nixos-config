{ ... }:

{
  programs.dankMaterialShell = {
    # Niri Integration
    # https://github.com/AvengeMedia/DankMaterialShell/blob/master/distro/nix/niri.nix
    niri = {
      enableKeybinds = true; # Automatic keybinding configuration
      enableSpawn = true; # Auto-start DMS with niri
    };

    # Core Featues
    enableSystemMonitoring = true; # System monitoring widgets (dgop)
    enableClipboard = true; # Clipboard history manager
    enableVPN = false; # VPN management widget
    enableBrightnessControl = true; # Backlight/brightness controls
    enableColorPicker = true; # Color picker tool
    enableDynamicTheming = false; # Wallpaper-based theming (matugen)
    enableAudioWavelength = false; # Audio visualizer (cava)
    enableCalendarEvents = false; # Calendar integration (khal)
    enableSystemSound = true; # System sound effects

    # Default Settings
    default.settings = {
      theme = "dark";
    };
  };
}
