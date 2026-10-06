{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "CSharp" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter.language_server.name = "roslyn";
          # Language & Tools -> LSP
          language_servers = [
            "roslyn"
          ];
        };
      };
    };
  };
}
