{ inputs, ... }:

{
  imports = [ inputs.noctalia.homeModules.default ];

  programs.noctalia-shell.enable = true;

  stylix.targets.noctalia-shell = {
    enable = true;
  };
}
