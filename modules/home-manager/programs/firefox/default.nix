{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  colors = config.lib.stylix.colors {
    template = ./assets/colors.css.mustache;
    extension = ".css";
  };
  userChrome = config.lib.stylix.colors {
    template = ./assets/userChrome.css.mustache;
    extension = ".css";
  };
  userContent = config.lib.stylix.colors {
    template = ./assets/userContent.css.mustache;
    extension = ".css";
  };
in
{
  imports = [
    ./bookmarks.nix
    ./extensions.nix
    ./layout.nix
    ./policies.nix
    ./search.nix
    ./settings.nix
  ];

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;

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

  stylix.targets.firefox = {
    enable = false;
    firefoxGnomeTheme.enable = true;
    profileNames = [
      "default"
    ];
  };
}
