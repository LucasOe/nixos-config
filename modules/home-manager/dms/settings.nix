{ ... }:

{
  programs.dank-material-shell = {
    # https://github.com/AvengeMedia/DankMaterialShell/blob/master/quickshell/Common/settings/SettingsSpec.js
    settings = {
      # Wallpaper
      screenPreferences.wallpaper = [ ]; # Disable Built-in Wallpapers

      # Theme & Colors
      cornerRadius = 8;

      # Time & Weather
      weatherEnabled = false;

      # Sounds
      soundsEnabled = false;

      # Workspaces
      showWorkspaceIndex = true;
      showWorkspaceName = true;
      showWorkspacePadding = false;
      showWorkspaceApps = true;
      maxWorkspaceIcons = 9;
      workspaceAppIconSizeOffset = 6;
      workspaceFollowFocus = true;
      showOccupiedWorkspacesOnly = true;

      # OSD
      osdPosition = 0;
      osdAlwaysShowValue = true;
      osdAudioOutputEnabled = true;
      osdBrightnessEnabled = true;
      osdCapsLockEnabled = true;
      osdIdleInhibitorEnabled = true;
      osdMediaPlaybackEnabled = false;
      osdMediaVolumeEnabled = true;
      osdMicMuteEnabled = true;
      osdPowerProfileEnabled = false;
      osdVolumeEnabled = true;

      # Power Menu
      powerMenuActions = [
        "lock"
        "logout"
        "reboot"
        "poweroff"
      ];

      # Audio
      hiddenOutputDeviceNames = [
        "easyeffects_sink"
        "alsa_output.usb-MOTU_M4_M4MA049C4N-00.pro-output-0"
      ];
      hiddenInputDeviceNames = [
        "easyeffects_sink"
        "alsa_input.usb-MOTU_M4_M4MA049C4N-00.pro-input-0"
      ];
    };

    session = {
      hiddenTrayIds = [
        "nm-applet"
      ];
    };
  };
}
