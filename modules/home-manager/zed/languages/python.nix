{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Python" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter.language_server.name = "ruff";
          code_actions_on_format = {
            "source.organizeImports.ruff" = true;
          };
          # Editor -> Indentation
          hard_tabs = false;
          # Language & Tools -> LSP
          language_servers = [
            "ty"
            "ruff"
          ];
        };
      };
    };
  };
}
