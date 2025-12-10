{ ... }:

{
  programs.television = {
    enable = true;

    settings = {
      ui = {
        status_bar = {
          enabled = true;
          hidden = true;
        };
        preview_panel = {
          enabled = true;
          hidden = true;
        };
        remote_control = {
          enabled = false;
          visible = false;
        };
        help_panel = {
          enabled = true;
          visible = false;
        };
      };
    };
  };
}
