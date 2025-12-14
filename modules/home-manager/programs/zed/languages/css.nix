{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      lsp = {
        "vscode-css-language-server" = {
          settings = {
            css = {
              lint = {
                unknownAtRules = "ignore";
              };
            };
          };
        };
      };
    };
  };
}
