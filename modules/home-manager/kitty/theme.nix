{ nixosConfig, ... }:

let
  theme = nixosConfig.theme.colors {
    template = ./theme.conf.mustache;
    target = "base16";
  };
in
{
  programs.kitty = {
    extraConfig = ''
      include ${theme}
    '';
  };
}
