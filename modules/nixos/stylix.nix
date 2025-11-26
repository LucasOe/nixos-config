{ pkgs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;

    # https://github.com/tinted-theming/schemes
    #
    # One Dark:
    # base00: "#282c34"
    # base01: "#353b45"
    # base02: "#3e4451"
    # base03: "#545862"
    # base04: "#565c64"
    # base05: "#abb2bf"
    # base06: "#b6bdca"
    # base07: "#c8ccd4"
    # base08: "#e06c75"
    # base09: "#d19a66"
    # base0A: "#e5c07b"
    # base0B: "#98c379"
    # base0C: "#56b6c2"
    # base0D: "#61afef"
    # base0E: "#c678dd"
    # base0F: "#be5046"
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
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
      light = "MoreWaita";
      dark = "MoreWaita";
      package = pkgs.morewaita-icon-theme;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };

    targets = {
      fontconfig.enable = true;
      gnome.enable = true;
      plymouth.enable = true;
    };
  };
}
