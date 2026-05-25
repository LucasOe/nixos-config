[
  {
    enabled = true;
    id = "default";
    name = "Main Bar";
    position = 0;

    borderEnabled = false;
    noBackground = false;
    showOnLastDisplay = false;
    spacing = 0;
    squareCorners = true;
    transparency = 1;
    visible = true;
    widgetOutlineEnabled = false;

    screenPreferences = [
      {
        name = "DP-2";
        model = "LG ULTRAGEAR";
      }
    ];

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
        id = "workspaceSwitcher";
        enabled = true;
      }
      {
        id = "focusedWindow";
        enabled = true;
      }
      {
        id = "music";
        enabled = true;
      }
    ];

    centerWidgets = [
      {
        id = "runningApps";
        enabled = true;
      }
    ];

    rightWidgets = [
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
        id = "controlCenterButton";
        enabled = true;

        showNetworkIcon = false;
        showBluetoothIcon = false;
        showAudioIcon = true;
        showAudioPercent = false;
        showVpnIcon = false;
        showBrightnessIcon = false;
        showBrightnessPercent = false;
        showMicIcon = true;
        showMicPercent = false;
        showBatteryIcon = false;
        showPrinterIcon = false;
        showScreenSharingIcon = false;
      }
      {
        id = "clock";
        enabled = true;
      }
    ];
  }
]
