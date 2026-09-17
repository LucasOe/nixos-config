{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Rust" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter.language_server.name = "rust-analyzer";
          # Editor -> Indentation
          hard_tabs = false;
          # Editor -> Inlay Hints
          inlay_hints.enabled = true;
          # Language & Tools -> LSP
          language_servers = [
            "rust-analyzer"
          ];
        };
      };
      lsp = {
        "rust-analyzer" = {
          # https://rust-analyzer.github.io/book/configuration.html
          initialization_options = {
            check = {
              command = "clippy"; # default: "check"
            };
          };
        };
      };
    };
  };
}
