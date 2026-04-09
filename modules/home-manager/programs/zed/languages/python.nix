{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Python" = {
          format_on_save = "on";
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
