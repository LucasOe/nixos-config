{ lib, pkgs, ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Lua" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter.language_server.name = "luau-lsp";
          # Editor -> Indentation
          hard_tabs = false;
          # Language & Tools -> LSP
          language_servers = [
            "lua-language-server"
          ];
        };
        "Luau" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter = {
            external = {
              command = lib.getExe pkgs.stylua;
              arguments = [ "-" ];
            };
          };
          # Editor -> Inlay Hints
          inlay_hints.enabled = true;
          # Language & Tools -> LSP
          language_servers = [
            "luau-lsp"
          ];
        };
      };
      lsp = {
        # https://github.com/4teapo/zed-luau
        "luau-lsp" = {
          settings = {
            "luau-lsp" = {
              sourcemap = {
                enabled = false;
              };
              inlayHints = {
                variableTypes = true;
              };
            };
          };
        };
      };
    };
  };
}
