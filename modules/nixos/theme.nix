{ configLib, pkgs, ... }:

{
  theme = {
    # https://github.com/tinted-theming/schemes
    colors = configLib.relativeToRoot "assets/themes/onedark.yaml";

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

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    icons = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    wallpaper = configLib.relativeToRoot "assets/wallpapers/nixos.png";
  };
}
