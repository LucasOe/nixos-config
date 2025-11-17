{ pkgs, ... }:

{
  stylix = {
    enable = true;

    # https://github.com/tinted-theming/schemes
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
    };
  };
}
