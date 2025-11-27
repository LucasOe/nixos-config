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
        name = "eDP-1";
        model = "LQ135P1JX51";
      }
    ];

    leftWidgets = [
      {
        id = "workspaceSwitcher";
        enabled = true;
      }
      {
        id = "runningApps";
        enabled = true;
      }
      {
        id = "focusedWindow";
        enabled = true;
      }
    ];

    centerWidgets = [
      {
        id = "clock";
        enabled = true;
      }
    ];

    rightWidgets = [
      {
        id = "systemTray";
        enabled = true;
      }
      {
        id = "clipboard";
        enabled = true;
      }
      {
        id = "notificationButton";
        enabled = true;
      }
      {
        id = "battery";
        enabled = true;
      }
      {
        id = "controlCenterButton";
        enabled = true;
        showNetworkIcon = true;
        showBluetoothIcon = true;
        showAudioIcon = true;
      }
    ];
  }
]
