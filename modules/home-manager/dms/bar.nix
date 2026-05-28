{ ... }:

{
  programs.dank-material-shell = {
    settings = {
      barConfigs = [
        {
          enabled = true;
          id = "default";
          name = "Main Bar";
          position = 0; # Position (Top: 0, Bottom: 1, Left: 2, Right: 3)

          # Display Assignment
          showingAll = false;
          showOnLastDisplay = false;
          screenPreferences = [
            {
              name = "DP-2";
              model = "LG ULTRAGEAR";
            }
          ];

          # Visibility
          autoHide = false;
          visible = true;
          clickThrough = false;
          openOnOverview = false;

          # Spacing
          spacing = 0;
          bottomGap = 0;
          innerPadding = 0;
          widgetPadding = 8;

          # Corners & Background
          squareCorners = true;
          noBackground = false;

          leftWidgets = [
            {
              id = "controlCenterButton";
              enabled = true;

              showNetworkIcon = false;
              showBluetoothIcon = false;
              showAudioIcon = false;
              showAudioPercent = false;
              showVpnIcon = false;
              showBrightnessIcon = false;
              showBrightnessPercent = false;
              showMicIcon = false;
              showMicPercent = false;
              showBatteryIcon = false;
              showPrinterIcon = false;
              showScreenSharingIcon = false;
            }
            {
              id = "cpuUsage";
              enabled = true;
            }
            {
              id = "cpuTemp";
              enabled = true;
            }
            {
              id = "memUsage";
              enabled = true;
            }
            {
              id = "music";
              enabled = true;
            }
          ];
          centerWidgets = [
            {
              id = "workspaceSwitcher";
              enabled = true;
            }
          ];
          rightWidgets = [
            {
              id = "capsLockIndicator";
              enabled = true;
            }
            {
              id = "systemTray";
              enabled = true;
            }
            {
              id = "notificationButton";
              enabled = true;
            }
            {
              id = "clipboard";
              enabled = true;
            }
            {
              id = "battery";
              enabled = true;
            }
            {
              id = "vpn";
              enabled = true;
            }
            {
              id = "clock";
              enabled = true;
            }
          ];
        }
      ];
    };
  };
}
