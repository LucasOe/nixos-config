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
    };
  };
}
