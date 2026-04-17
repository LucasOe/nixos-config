{ ... }:

{
  imports = [
    ./languages
    ./keymap.nix
    ./settings.nix
    ./theme.nix
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
      "csharp"
      "dockerfile"
      "emmet"
      "fish"
      "html"
      "nix"
      # "oxc" # https://github.com/oxc-project/oxc-zed/issues/29
      "sql"
      "toml"
      # Other
      "dependi"
    ];
  };

  stylix.targets.zed = {
    enable = false;
  };
}
