{ configLib, config, ... }:

{
  programs.noctalia-shell = {
    # Docs: https://docs.noctalia.dev/getting-started/nixos/#config-ref
    # Default Settings: https://github.com/noctalia-dev/noctalia-shell/blob/main/Assets/settings-default.json
    settings = {
      bar = {
        monitors = [
          "eDP-1"
          "DP-2"
        ];
        position = "top";
        showCapsule = true;
        outerCorners = false;
        # https://github.com/noctalia-dev/noctalia-shell/blob/6fc754104858479e02bf51a55eef5e4e8ad722b3/Services/UI/BarWidgetRegistry.qml
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              id = "Workspace";
              hideUnoccupied = true;
            }
            {
              id = "SystemMonitor";
            }
            {
              id = "MediaMini";
              maxWidth = 200;
            }
          ];
          center = [
            {
              id = "Taskbar";
            }
          ];
          right = [
            {
              id = "Tray";
              blacklist = [
                "nm-applet"
              ];
              pinned = [
                "Discord"
                "nm-applet"
                "spotify-client"
                "steam"
                "Vesktop"
              ];
            }
            {
              id = "plugin:mini-docker";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Battery";
            }
            {
              id = "Microphone";
              displayMode = "alwaysHide";
            }
            {
              id = "Volume";
              displayMode = "alwaysHide";
            }
            {
              id = "VPN";
            }
            {
              id = "Clock";
              usePrimaryColor = false;
            }
          ];
        };
      };
      general = {
        avatarImage = configLib.relativeToRoot "assets/avatars/tamas.png";
        compactLockScreen = true;
        dimmerOpacity = 0.5;
        radiusRatio = 0.5;
        enableShadows = true;
        shadowDirection = "center";
      };
      location = {
        name = "Hamm, Germany";
        weatherShowEffects = false;
        analogClockInCalendar = true;
        firstDayOfWeek = 1;
      };
      wallpaper = {
        overviewEnabled = true;
        directory = configLib.relativeToRoot "assets/wallpapers";
        defaultWallpaper = config.stylix.image;
        fillMode = config.stylix.imageScalingMode;
        fillColor = "#21252b";
        transitionType = "fade";
      };
      appLauncher = {
        enableClipboardHistory = true;
        terminalCommand = "ghostty";
      };
      controlCenter = {
        position = "close_to_bar_button";
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
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = false;
            id = "media-sysmon-card";
          }
        ];
      };
      dock = {
        enabled = false;
      };
      sessionMenu = {
        enableCountdown = false;
        powerOptions = [
          {
            "action" = "lock";
            "enabled" = true;
          }
          {
            "action" = "suspend";
            "enabled" = true;
          }
          {
            "action" = "hibernate";
            "enabled" = false;
          }
          {
            "action" = "reboot";
            "enabled" = true;
          }
          {
            "action" = "logout";
            "enabled" = true;
          }
          {
            "action" = "shutdown";
            "enabled" = true;
          }
        ];
      };
      notifications = {
        monitors = [
          "eDP-1"
          "DP-2"
        ];
      };
      osd = {
        enabledTypes = [
          0 # Output volume
          1 # Input volume
          2 # Brightness
          3 # Lock keys
          4 # IPC Messages
        ];
        monitors = [
          "eDP-1"
          "DP-2"
        ];
      };
    };
  };
}
