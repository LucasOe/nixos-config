{ lib, pkgs, ... }:

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

    mimeApps =
      let
        # https://github.com/krezh/dotnix/blob/main/modules/programs/xdg-settings/homeManager.nix
        allMimes = lib.splitString "\n" (builtins.readFile "${pkgs.shared-mime-info}/share/mime/types");
        matchingMimes = prefix: builtins.filter (mime: lib.hasPrefix prefix mime) allMimes;
        defaultsFor = prefix: app: lib.genAttrs (matchingMimes prefix) (_: app);

        # Default Applications
        defaultTextEditor = "dev.zed.Zed.desktop";
        defaultImageViewer = "org.gnome.Loupe.desktop";
        defaultVideoPlayer = "org.gnome.Showtime.desktop";
        defaultAudioPlayer = "org.gnome.Showtime.desktop";

        mediaDefaults = lib.mkMerge [
          (defaultsFor "text/" defaultTextEditor)
          (defaultsFor "image/" defaultImageViewer)
          (defaultsFor "video/" defaultVideoPlayer)
          (defaultsFor "audio/" defaultAudioPlayer)
        ];

        manualDefaults = {
          "inode/directory" = "org.gnome.Nautilus.desktop";
          # Text
          "application/json" = defaultTextEditor;
          "application/toml" = defaultTextEditor;
          "application/x-sh" = defaultTextEditor;
          "application/x-shellscript" = defaultTextEditor;
          "application/xml" = defaultTextEditor;
          "application/yaml" = defaultTextEditor;
        };
      in
      {
        enable = true;

        defaultApplications = lib.mkMerge [
          mediaDefaults
          manualDefaults
        ];
      };
  };
}
