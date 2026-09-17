{
  config,
  lib,
  nixosConfig,
  ...
}:

let
  cfg = config.my.zed;
in
{
  options.my.zed = {
    enable = lib.mkEnableOption "Zed Editor" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;

      # Make settings read only
      mutableUserKeymaps = false;
      mutableUserSettings = false;
      mutableUserTasks = false;

      # Extensions removed from this list do not get automaticall removed
      # See: https://github.com/zed-industries/zed/issues/40266
      extensions = [
        "colored-zed-icons-theme"
        # LSPs
        "biome"
        "emmet"
        "html"
        "java"
        "kotlin"
        "lua"
        "luau"
        "nix"
        "oxc" # https://github.com/oxc-project/oxc-zed/issues/29
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
  };
}
