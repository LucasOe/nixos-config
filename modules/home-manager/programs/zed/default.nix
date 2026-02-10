{ inputs, pkgs, ... }:

let
  zedFlake = inputs.zed-editor.packages.${pkgs.system};
in
{
  imports = [
    ./settings.nix
    ./theme.nix
    ./languages
  ];

  programs.zed-editor = {
    enable = true;
    package = zedFlake.default;

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
      "sql"
      "toml"
    ];
  };

  stylix.targets.zed = {
    enable = false;
  };
}
