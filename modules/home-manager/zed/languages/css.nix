{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "CSS" = {
          formatter = "none"; # Formatter should be set per project (Prettier, Biome or Oxfmt)
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
