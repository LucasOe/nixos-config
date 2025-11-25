{ username, ... }:

{
  programs.noctalia-shell = {
    # Docs: https://docs.noctalia.dev/getting-started/nixos/#config-ref
    # Defauls Settings: https://github.com/noctalia-dev/noctalia-shell/blob/main/Assets/settings-default.json
    settings = {
      bar = {
        position = "top";
        showCapsule = true;
        outerCorners = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "SystemMonitor";
            }
            {
              id = "MediaMini";
            }
          ];
          center = [
            {
              id = "Workspace";
            }
          ];
          right = [
            {
              id = "Tray";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Battery";
            }
            {
              id = "Volume";
            }
            {
              id = "Brightness";
            }
            {
              id = "Clock";
              usePrimaryColor = false;
            }
          ];
        };
      };
      general = {
        avatarImage = "/home/${username}/Pictures/Avatars/Tamas.png";
        dimmerOpacity = 0.5;
        radiusRatio = 0.5;
        enableShadows = false;
      };
      ui = {
        fontDefault = "JetBrains Mono";
        fontFixed = "JetBrains Mono";
      };
      location = {
        name = "Berlin, Germany";
      };
      wallpaper = {
        overviewEnabled = true;
        directory = "/home/${username}/Pictures/Wallpapers";
        defaultWallpaper = "/home/${username}/Pictures/Wallpapers/amber.jpg";
      };
      appLauncher = {
        enableClipboardHistory = true;
        terminalCommand = "ghostty";
      };
      controlCenter = {
        position = "close_to_bar_button";
        shortcuts = {
          left = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              id = "ScreenRecorder";
            }
            {
              id = "WallpaperSelector";
            }
          ];
          right = [
            {
              id = "Notifications";
            }
            {
              id = "PowerProfile";
            }
            {
              id = "KeepAwake";
            }
            {
              id = "NightLight";
            }
          ];
        };
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = true;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };
      dock = {
        enabled = false;
      };
      colorSchemes = {
        predefinedScheme = "Monochrome";
      };
    };
  };
}
