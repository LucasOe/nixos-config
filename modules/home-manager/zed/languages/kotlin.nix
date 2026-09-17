{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Kotlin" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter.language_server.name = "kotlin-lsp";
          # Language & Tools -> LSP
          language_servers = [
            "kotlin-lsp" # Kotlin LSP (by JetBrains)
          ];
        };
      };
    };
  };
}
