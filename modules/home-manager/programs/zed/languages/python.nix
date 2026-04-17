{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Python" = {
          format_on_save = "on";
          code_actions_on_format = {
            "source.organizeImports.ruff" = true;
          };
          # Enable ty, disable basedpyright and pylsp, and enable all
          # other registered language servers (ruff, pyright).
          language_servers = [
            "ty"
            "!basedpyright"
            "!pylsp" # https://github.com/zed-industries/zed/issues/37323
            "..."
          ];
        };
      };
    };
  };
}
