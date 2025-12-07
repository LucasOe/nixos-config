{ lib, ... }:

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
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      userChrome = lib.mkAfter (builtins.readFile ./assets/userChrome.css);
      userContent = lib.mkAfter (builtins.readFile ./assets/userContent.css);
    };
  };

  stylix.targets.firefox = {
    enable = true;
    firefoxGnomeTheme.enable = true;
    profileNames = [
      "default"
    ];
  };
}
