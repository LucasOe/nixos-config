{ ... }:

{
  # https://danklinux.com/docs/dankmaterialshell/nixos
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
    # https://github.com/AvengeMedia/DankMaterialShell/blob/master/quickshell/Common/settings/SettingsSpec.js
    # https://github.com/AvengeMedia/DankMaterialShell/blob/master/quickshell/Common/SettingsData.qml
    default.settings = {
      currentThemeName = "blue";
      cornerRadius = 12;
      monoFontFamily = "JetBrains Mono";
      dankBarSpacing = 0;
      dankBarSquareCorners = true;

      weatherEnabled = false;

      controlCenterWidgets = [
        {
          id = "volumeSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "brightnessSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
      ];
    };
  };
}
