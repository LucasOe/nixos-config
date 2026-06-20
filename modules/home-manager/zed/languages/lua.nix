{ ... }:

{
  programs.zed-editor = {
    userSettings = {
      languages = {
        "Lua" = {
          format_on_save = "on";
          hard_tabs = false;
        };
        "Luau" = {
          format_on_save = "on";
          formatter = {
            external = {
              command = "stylua";
              arguments = [ "-" ];
            };
          };
          inlay_hints.enabled = true;
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
