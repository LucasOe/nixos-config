{ lib, nixosConfig, ... }:

{
  xdg = {
    enable = true;

    userDirs = {
      enable = true;
      setSessionVariables = false;
    };

    autostart = {
      enable = true;
      readOnly = true;
    };

    mimeApps =
      let
        defaultAudioPlayer = "org.gnome.Showtime.desktop";
        defaultBrowser = "firefox-devedition.desktop";
        defaultDocumentViewer = "org.gnome.Papers.desktop";
        defaultImageViewer = "org.gnome.Loupe.desktop";
        defaultTextEditor = "dev.zed.Zed.desktop";
        defaultVideoPlayer = "org.gnome.Showtime.desktop";
      in
      {
        enable = lib.mkDefault nixosConfig.my.gui.enable;
        defaultApplications = {
          # Globs
          "text/*" = defaultTextEditor;
          "image/*" = defaultImageViewer;
          "video/*" = defaultVideoPlayer;
          "audio/*" = defaultAudioPlayer;
          # Directories
          "inode/directory" = "org.gnome.Nautilus.desktop";
          # Text
          "application/json" = defaultTextEditor;
          "application/toml" = defaultTextEditor;
          "application/x-sh" = defaultTextEditor;
          "application/x-shellscript" = defaultTextEditor;
          "application/xml" = defaultTextEditor;
          "application/yaml" = defaultTextEditor;
          # Documents
          "application/pdf" = defaultDocumentViewer;
          # Browser
          "x-scheme-handler/http" = defaultBrowser;
          "x-scheme-handler/https" = defaultBrowser;
        };
      };
  };
}
