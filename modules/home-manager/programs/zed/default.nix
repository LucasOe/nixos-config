{ ... }:

{
  imports = [
    ./settings.nix
    ./theme.nix
    ./languages
  ];

  programs.zed-editor = {
    enable = true;

    # Make settings read only
    mutableUserKeymaps = false;
    mutableUserSettings = false;
    mutableUserTasks = false;

    # Extensions
    extensions = [
      "biome"
      "nix"
    ];
  };

  stylix.targets.zed = {
    enable = false;
  };
}
