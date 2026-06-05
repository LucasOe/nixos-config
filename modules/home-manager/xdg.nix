{ lib, pkgs, ... }:

{
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      setSessionVariables = false;
    };

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
    };

    mimeApps =
      let
        # FIXME: Functions can be removed if globbing is officially supported by home-manager
        # https://github.com/nix-community/home-manager/issues/8752#issuecomment-4568645264

        # https://github.com/krezh/dotnix/blob/main/modules/programs/xdg-settings/homeManager.nix
        allMimes = lib.splitString "\n" (builtins.readFile "${pkgs.shared-mime-info}/share/mime/types");
        matchingMimes = prefix: builtins.filter (mime: lib.hasPrefix prefix mime) allMimes;
        defaultsFor = prefix: app: lib.genAttrs (matchingMimes prefix) (_: app);

        # Default Applications
        defaultTextEditor = "dev.zed.Zed.desktop";
        defaultImageViewer = "org.gnome.Loupe.desktop";
        defaultVideoPlayer = "org.gnome.Showtime.desktop";
        defaultAudioPlayer = "org.gnome.Showtime.desktop";
        defaultBrowser = "firefox-devedition.desktop";

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
          # Browser
          "x-scheme-handler/http" = defaultBrowser;
          "x-scheme-handler/https" = defaultBrowser;
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
