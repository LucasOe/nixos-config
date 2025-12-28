{ configLib, config, ... }:

{
  programs.noctalia-shell = {
    # Docs: https://docs.noctalia.dev/getting-started/nixos/#config-ref
    # Defauls Settings: https://github.com/noctalia-dev/noctalia-shell/blob/main/Assets/settings-default.json
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
              onlySameOutput = false;
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
        dimmerOpacity = 0.5;
        radiusRatio = 0.5;
        enableShadows = true;
        shadowDirection = "center";
      };
      location = {
        name = "Hamm, Germany";
        weatherShowEffects = false;
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
      osd = {
        enabledTypes = [
          0 # Output volume
          1 # Input volume
          2 # Brightness
          3 # Lock keys
        ];
      };
    };
  };
}
