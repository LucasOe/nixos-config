{ config, ... }:

{
  programs.dank-material-shell = {
    # https://github.com/AvengeMedia/DankMaterialShell/blob/master/quickshell/Common/settings/SettingsSpec.js
    settings = {
      barConfigs = import ./bar.nix;
      controlCenterWidgets = import ./widgets.nix;

      # Theme
      currentThemeName = "blue";
      cornerRadius = 12;
      wallpaperFillMode = "Fit";
      blurredWallpaperLayer = false;
      blurWallpaperOnOverview = false;
      monoFontFamily = "JetBrains Mono";

      # Control Center
      controlCenterShowAudioIcon = true;
      controlCenterShowBatteryIcon = false;
      controlCenterShowBluetoothIcon = true;
      controlCenterShowBrightnessIcon = true;
      controlCenterShowMicIcon = true;
      controlCenterShowNetworkIcon = true;
      controlCenterShowPrinterIcon = false;
      controlCenterShowVpnIcon = true;

      # Notifications
      notificationOverlayEnabled = false;
      notificationPopupPosition = 0;

      # OSD
      osdPosition = 0;
      osdAlwaysShowValue = true;
      osdBrightnessEnabled = true;
      osdCapsLockEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMediaVolumeEnabled = true;
      osdMicMuteEnabled = true;
      osdPowerProfileEnabled = true;
      osdVolumeEnabled = true;

      # Power Menu
      powerActionConfirm = true;
      powerActionHoldDuration = 1;
      powerMenuDefaultAction = "logout";
      powerMenuGridLayout = false;
      powerMenuActions = [
        "reboot"
        "logout"
        "poweroff"
        "lock"
        "suspend"
      ];

      # Toggle Features
      showBattery = true;
      showCapsLockIndicator = true;
      showClipboard = true;
      showClock = true;
      showControlCenterButton = true;
      showCpuTemp = true;
      showCpuUsage = true;
      showDock = false;
      showFocusedWindow = true;
      showGpuTemp = true;
      showLauncherButton = true;
      showMemUsage = true;
      showMusic = true;
      showNotificationButton = true;
      showOccupiedWorkspacesOnly = false;
      showPrivacyButton = true;
      showSystemTray = true;
      showWeather = false;

      # Sounds
      soundsEnabled = false;

      # Weather
      weatherEnabled = false;
    };

    # https://github.com/AvengeMedia/DankMaterialShell/blob/master/quickshell/Common/settings/SessionSpec.js
    session = {
      wallpaperPath = config.stylix.image;
    };
  };
}
