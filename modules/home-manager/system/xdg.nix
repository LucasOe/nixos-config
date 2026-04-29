{ ... }:

{
  xdg = {
    enable = true;
    userDirs.enable = true;

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
    };

    mimeApps = {
      enable = true;

      defaultApplications = {
        "inode/directory" = "org.gnome.Nautilus.desktop";
        "text/plain" = "dev.zed.Zed.desktop";
      };
    };
  };
}
