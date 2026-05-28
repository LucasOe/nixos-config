{ inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia = {
    enable = true;
  };

  # Reset settings on activation
  home.file.".local/state/noctalia/settings.toml" = {
    force = true;
    text = "";
  };
}
