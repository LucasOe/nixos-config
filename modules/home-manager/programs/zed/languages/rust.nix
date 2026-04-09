{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Rust" = {
          format_on_save = "on";
          inlay_hints.enabled = true;
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
