{ config, ... }:

let
  midnightTheme = config.lib.stylix.colors {
    template = ./themes/midnight.css.mustache;
    extension = ".css";
  };
  disblockOriginTheme = config.lib.stylix.colors {
    template = ./themes/disblockOrigin.css.mustache;
    extension = ".css";
  };
in
{
  home.file = {
    ".config/vesktop/userAssets/tray".source = ./userAssets/tray.png;
    ".config/vesktop/userAssets/trayUnread".source = ./userAssets/trayUnread.png;
  };

  programs.vesktop = {
    enable = true;

    settings = {
      arRPC = false;
      autoStartMinimized = true;
      checkUpdates = false;
      clickTrayToShowHide = true;
      disableMinSize = true;
      hardwareAcceleration = true;
      hardwareVideoAcceleration = true;
      minimizeToTray = true;
      openLinksWithElectron = false;
      splashBackground = config.lib.stylix.colors.withHashtag.base01;
      splashColor = config.lib.stylix.colors.withHashtag.base05;
    };

    vencord = {
      themes = {
        midnight = midnightTheme;
        disblockOrigin = disblockOriginTheme;
      };
      settings = {
        enabledThemes = [
          "midnight.css"
          "disblockOrigin.css"
        ];
        themeLinks = [
          "https://codeberg.org/ridge/Discord-Adblock/raw/branch/main/discord-adblock.css"
        ];
        plugins = {
          NoProfileThemes = {
            enabled = true;
          };
        };
      };
    };

  };

  stylix.targets.nixcord = {
    enable = false;
  };

  xdg.desktopEntries = {
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
}
