{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Java" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter.language_server.name = "jdtls";
          # Language & Tools -> LSP
          language_servers = [
            "jdtls" # Eclipse JDT Language Server
          ];
        };
        "Gradle" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter.language_server.name = "gradle-language-server";
          # Language & Tools -> LSP
          language_servers = [
            "gradle-language-server"
          ];
        };
      };
    };
  };
}
