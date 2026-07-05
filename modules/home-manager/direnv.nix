{ ... }:

{
  programs.direnv = {
    enable = true;
    silent = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables = {
    DIRENV_WARN_TIMEOUT = "24h";
  };
}
