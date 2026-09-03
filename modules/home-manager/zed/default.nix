{ ... }:

{
  programs.zed-editor = {
    enable = true;

    # Make settings read only
    mutableUserKeymaps = false;
    mutableUserSettings = false;
    mutableUserTasks = false;

    # Extensions removed from this list do not get automaticall removed
    # See: https://github.com/zed-industries/zed/issues/40266
    extensions = [
      "biome"
      "colored-zed-icons-theme"
      "csharp"
      "depsy-lsp"
      "dockerfile"
      "emmet"
      "fish"
      "html"
      "lua"
      "luau"
      "nix"
      "oxc" # https://github.com/oxc-project/oxc-zed/issues/29
      "sql"
      "toml"
      "tsgo"
    ];
  };

  home.shellAliases = {
    zed = "zeditor";
  };

  home.sessionVariables = {
    EDITOR = "zeditor";
    VISUAL = "zeditor";
  };
}
