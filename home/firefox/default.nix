{ lib, ... }:

{
  imports = [
    ./extensions.nix
    ./layout.nix
    ./pinned.nix
    ./policies.nix
    ./search.nix
    ./settings.nix
  ];

  home.file = {
    ".mozilla/firefox/default/chrome/customChrome.css".source = ./assets/customChrome.css;
    ".mozilla/firefox/default/chrome/customContent.css".source = ./assets/customContent.css;
  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      userChrome = lib.mkAfter ''
        @import "customChrome.css";
        @import "customContent.css";
      '';
    };
  };

  stylix.targets.firefox = {
    firefoxGnomeTheme.enable = true;
    profileNames = [
      "default"
    ];
  };
}
