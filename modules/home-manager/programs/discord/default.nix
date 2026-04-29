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
  discordAdblockTheme = config.lib.stylix.colors {
    template = ./themes/discordAdblock.css.mustache;
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

    # https://github.com/Vencord/Vesktop/blob/main/src/shared/settings.d.ts
    settings = {
      appBadge = false;
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
        discordAdblock = discordAdblockTheme;
      };
      settings = {
        enabledThemes = [
          "midnight.css"
          "disblockOrigin.css"
          # "discordAdblock.css" # https://codeberg.org/ridge/Discord-Adblock/issues/52
        ];
        plugins = {
          NoProfileThemes = {
            enabled = true;
          };
          CustomIdle = {
            enabled = true;
            idleTimeout = 0;
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
      exec = "vesktop --user-agent-os windows %U";
      icon = "discord";
      genericName = "Internet Messenger";
      categories = [
        "Network"
        "InstantMessaging"
        "Chat"
      ];
      mimeType = [ "x-scheme-handler/discord" ];
    };
  };
}
