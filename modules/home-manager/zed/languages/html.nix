{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "HTML" = {
          # Language & Tools -> LSP
          language_servers = [
            "biome"
            "emmet-language-server"
            "oxfmt"
            "oxlint"
            "vscode-html-languageservice"
          ];
        };
      };
    };
  };
}
