{
  config,
  inputs,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.firefox;

  colors = nixosConfig.theme.colors {
    template = ./assets/colors.css.mustache;
    extension = ".css";
  };
  userChrome = nixosConfig.theme.colors {
    template = ./assets/userChrome.css.mustache;
    extension = ".css";
  };
  userContent = nixosConfig.theme.colors {
    template = ./assets/userContent.css.mustache;
    extension = ".css";
  };
in
{
  options.my.firefox = {
    enable = lib.mkEnableOption "Firefox" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox;
      configPath = "${config.xdg.configHome}/mozilla/firefox";

      profiles = {
        # Set dev edition profile to the same as default release
        dev-edition-default = {
          path = "default";
          id = 1;
        };

        default = {
          id = 0;
          name = "default";
          isDefault = true;

          userChrome = lib.mkAfter ''
            @import "${inputs.firefox-gnome-theme}/userChrome.css";
            @import "${colors}";
            @import "${userChrome}";
          '';
          userContent = lib.mkAfter ''
            @import "${inputs.firefox-gnome-theme}/userContent.css";
            @import "${colors}";
            @import "${userContent}";
          '';
        };
      };
    };

    home.file.".mozilla/native-messaging-hosts".enable = false;
  };
}
