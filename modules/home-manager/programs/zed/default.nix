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
      # Themes
      "colored-zed-icons-theme"
      # Languages / Grammars
      "biome"
      "dockerfile"
      "emmet"
      "fish"
      "html"
      "nix"
      "sql"
      "toml"
    ];
  };

  stylix.targets.zed = {
    enable = false;
  };
}
