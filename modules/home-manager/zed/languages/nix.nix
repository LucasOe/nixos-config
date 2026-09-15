{ lib, pkgs, ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Nix" = {
          format_on_save = "on";
          formatter = "language_server";
          hard_tabs = false;
          tab_size = 2;
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
