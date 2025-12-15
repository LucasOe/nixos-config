{ ... }:

{
  xdg = {
    enable = true;
    # Hide desktop entries
    desktopEntries = {
      qt5ct = {
        name = "Qt5 Settings";
        noDisplay = true;
      };
      qt6ct = {
        name = "Qt6 Settings";
        noDisplay = true;
      };
      kvantummanager = {
        name = "Kvantum Manager";
        noDisplay = true;
      };
      gnome-system-monitor-kde = {
        name = "GNOME System Monitor";
        noDisplay = true;
      };
      vesktop = {
        name = "Discord";
        exec = "vesktop %U";
        icon = "discord";
        genericName = "Internet Messenger";
        categories = [
          "Network"
          "InstantMessaging"
          "Chat"
        ];
      };
    };
  };
}
