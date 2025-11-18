{ ... }:

{
  imports = [
    ./extensions.nix
    ./layout.nix
    ./pinned.nix
    ./search.nix
    ./settings.nix
  ];

  programs.firefox = {
    enable = true;
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
    };
  };

  stylix.targets.firefox = {
    colorTheme.enable = true;
    profileNames = [
      "default"
    ];
  };
}
