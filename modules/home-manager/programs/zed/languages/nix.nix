{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Nix" = {
          format_on_save = "on";
          hard_tabs = false;
          tab_size = 2;
        };
      };
      lsp = {
        "nixd" = {
          settings = {
            diagnostic = {
              suppress = [ "sema-extra-with" ];
            };
          };
        };
        "nil" = {
          settings = {
            diagnostics = {
              ignored = [ "unused_binding" ];
            };
          };
        };
      };
    };
  };
}
