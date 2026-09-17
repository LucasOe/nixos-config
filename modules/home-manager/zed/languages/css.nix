{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "CSS" = {
          # Language & Tools -> LSP
          language_servers = [
            "emmet-language-server"
            "tailwindcss-intellisense-css"
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
