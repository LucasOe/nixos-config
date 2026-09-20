{ lib, pkgs, ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Nix" = {
          # Editor -> Formatting
          format_on_save = "on";
          formatter = {
            external = {
              command = lib.getExe pkgs.nixfmt;
              arguments = [ "-" ];
            };
          };
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
