{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "JavaScript" = {
          formatter = "none"; # Formatter should be set per project (Prettier, Biome or Oxfmt)
          code_actions_on_format = {
            "source.fixAll.eslint" = true;
            "source.fixAll.oxc" = true;
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
        };
        "TypeScript" = {
          formatter = "none"; # Formatter should be set per project (Prettier, Biome or Oxfmt)
          code_actions_on_format = {
            "source.fixAll.eslint" = true;
            "source.fixAll.oxc" = true;
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
          language_servers = [
            "typescript-ls" # Use tsgo
            "!vtsls"
            "!typescript-language-server"
            "..."
          ];
        };
        "TSX" = {
          formatter = "none"; # Formatter should be set per project (Prettier, Biome or Oxfmt)
          code_actions_on_format = {
            "source.fixAll.eslint" = true;
            "source.fixAll.oxc" = true;
            "source.fixAll.biome" = true;
            "source.organizeImports.biome" = true;
          };
          language_servers = [
            "typescript-ls" # Use tsgo
            "!vtsls"
            "!typescript-language-server"
            "..."
          ];
        };
      };
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
