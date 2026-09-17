{ lib, ... }:

{
  programs.zed-editor = {
    userSettings = {
      # Shared settings by JavaScript, TypeScript, JSX and TSX.
      # JSX falls under the Javascript language name.
      # Enable the tsgo LSP for JavaScript for JSDoc support.
      languages = lib.genAttrs [ "JavaScript" "TypeScript" "TSX" ] (_: {
        # Editor -> Formatting
        code_actions_on_format = {
          "source.fixAll.eslint" = true;
          "source.fixAll.oxc" = true;
          "source.fixAll.biome" = true;
          "source.organizeImports.biome" = true;
        };
        # Language & Tools -> LSP
        language_servers = [
          "biome"
          "emmet-language-server"
          "oxfmt"
          "oxlint"
          "typescript-ls" # tsgo
        ];
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
