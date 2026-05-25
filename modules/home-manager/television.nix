{ ... }:

{
  programs.television = {
    enable = true;

    # Disable when using fzf
    enableBashIntegration = false;
    enableFishIntegration = false;
    enableZshIntegration = false;

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
