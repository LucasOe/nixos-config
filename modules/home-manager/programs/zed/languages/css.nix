{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "CSS" = {
          language_servers = [
            "tailwindcss-intellisense-css"
            "!vscode-css-language-server"
            "..."
          ];
        };
      };
      lsp = {
        "tailwindcss-language-server" = {
          settings = {
            classFunctions = [
              "clsx"
              "cn"
              "cva"
              "cx"
              "tw"
              "tw\\.[a-z-]+"
              "twJoin"
              "twMerge"
            ];
          };
        };
      };
    };
  };
}
