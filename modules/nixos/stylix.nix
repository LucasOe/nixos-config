{ pkgs, configLib, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;

    # https://github.com/tinted-theming/schemes
    base16Scheme = configLib.relativeToRoot "assets/themes/onedark.yaml";
    polarity = "dark";

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

    icons = {
      enable = true;
      light = "Papirus-Light";
      dark = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    image = configLib.relativeToRoot "assets/wallpapers/nixos.png";
    imageScalingMode = "fit";

    targets = {
      fontconfig.enable = true;
      gnome.enable = true;
      plymouth.enable = true;
    };
  };
}
