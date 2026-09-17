{ lib, pkgs, ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Nix" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter.language_server.name = "nil";
          # Editor -> Indentation
          hard_tabs = false;
          tab_size = 2;
          # Language & Tools -> LSP
          language_servers = [
            "nixd"
            "nil"
          ];
        };
      };
      lsp = {
        "nixd" = {
          binary = {
            path = lib.getExe pkgs.nixd;
          };
          initialization_options = {
            "formatting".command = [ (lib.getExe pkgs.nixfmt) ];
          };
          settings = {
            diagnostic = {
              suppress = [ "sema-extra-with" ];
            };
          };
        };
        "nil" = {
          binary = {
            path = lib.getExe pkgs.nil;
          };
          initialization_options = {
            "formatting".command = [ (lib.getExe pkgs.nixfmt) ];
          };
          settings = {
            diagnostics = {
              ignored = [ "unused_binding" ];
            };
            nix = {
              flake = {
                autoArchive = true;
              };
            };
          };
        };
      };
    };
  };
}
