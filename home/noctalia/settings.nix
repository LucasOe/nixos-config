{ ... }:

{
  programs.noctalia-shell = {
    # https://docs.noctalia.dev/getting-started/nixos/#config-ref
    settings = {
      bar = {
        density = "compact";
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
              id = "ActiveWindow";
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
              id = "ScreenRecorder";
            }
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
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      general = {
        avatarImage = "";
        radiusRatio = 1.0;
      };
      ui = {
        fontDefault = "JetBrains Mono";
        fontFixed = "JetBrains Mono";
      };
      location = {
        name = "Berlin, Germany";
      };
      appLauncher = {
        nableClipboardHistory = true;
        terminalCommand = "kitty";
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
