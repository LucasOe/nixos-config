{ lib, ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = lib.genAttrs [ "JavaScript" "TypeScript" "TSX" ] (_: {
        formatter = "none"; # Formatter should be set per project (Prettier, Biome or Oxfmt)
        code_actions_on_format = {
          "source.fixAll.eslint" = true;
          "source.fixAll.oxc" = true;
          "source.fixAll.biome" = true;
          "source.organizeImports.biome" = true;
        };
      });
      lsp = {
        # https://biomejs.dev/reference/zed/
        "biome" = {
          settings = {
            require_config_file = true;
          };
        };
      };
    };
  };
}
