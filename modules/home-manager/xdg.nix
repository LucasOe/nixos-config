{ lib, pkgs, ... }:

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
        # FIXME: Functions can be removed if globbing is officially supported by home-manager
        # https://github.com/nix-community/home-manager/issues/8752#issuecomment-4568645264

        # https://github.com/krezh/dotnix/blob/main/modules/programs/xdg-settings/homeManager.nix
        allMimes = lib.splitString "\n" (builtins.readFile "${pkgs.shared-mime-info}/share/mime/types");
        matchingMimes = prefix: builtins.filter (mime: lib.hasPrefix prefix mime) allMimes;
        defaultsFor = prefix: app: lib.genAttrs (matchingMimes prefix) (_: app);

        # Default Applications
        defaultAudioPlayer = "org.gnome.Showtime.desktop";
        defaultBrowser = "firefox-devedition.desktop";
        defaultDocumentViewer = "org.gnome.Papers.desktop";
        defaultImageViewer = "org.gnome.Loupe.desktop";
        defaultTextEditor = "dev.zed.Zed.desktop";
        defaultVideoPlayer = "org.gnome.Showtime.desktop";

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
          # Documents
          "application/pdf" = defaultDocumentViewer;
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
