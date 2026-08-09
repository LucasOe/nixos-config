{
  config,
  inputs,
  lib,
  options,
  pkgs,
  ...
}:

let
  cfg = config.theme;
in
{
  options.theme = {
    colors = lib.mkOption {
      description = ''
        Scheme attributes or a path to a YAML file.
        See: https://github.com/tinted-theming/home/blob/main/builder.md#schemes-repository

        If you use scheme as a function, it will call `mkTheme`.
        See: https://github.com/SenchoPens/base16.nix/blob/main/DOCUMENTATION.md#mktheme
      '';
      type = options.scheme.type;
    };

    fonts = {
      serif = {
        package = lib.mkPackageOption pkgs "dejavu_fonts" { };
        name = lib.mkOption {
          default = "DejaVu Serif";
          description = "Name of the Serif font.";
          type = lib.types.str;
        };
      };
      sansSerif = {
        package = lib.mkPackageOption pkgs "dejavu_fonts" { };
        name = lib.mkOption {
          default = "DejaVu Sans";
          description = "Name of the Sans-serif font.";
          type = lib.types.str;
        };
      };
      monospace = {
        package = lib.mkPackageOption pkgs "dejavu_fonts" { };
        name = lib.mkOption {
          default = "DejaVu Sans Mono";
          description = "Name of the Monospace font.";
          type = lib.types.str;
        };
      };
    };

    cursor = {
      package = lib.mkOption {
        description = "Package providing the cursor theme.";
        type = lib.types.nullOr lib.types.package;
        default = null;
      };
      name = lib.mkOption {
        description = "The cursor name within the package.";
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
      size = lib.mkOption {
        description = "The cursor size.";
        type = lib.types.nullOr lib.types.int;
        default = null;
      };
    };

    icons = {
      package = lib.mkOption {
        description = "Package providing the icon theme.";
        type = lib.types.nullOr lib.types.package;
        default = null;
      };
      name = lib.mkOption {
        description = "Icon theme name.";
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
    };

    wallpaper = lib.mkOption {
      description = "Wallpaper image.";
      # Ensure the path is copied to the store
      type = with lib.types; nullOr (coercedTo path (src: "${src}") pathInStore);
      default = null;
    };

    avatar = lib.mkOption {
      description = "Avatar image.";
      # Ensure the path is copied to the store
      type = with lib.types; nullOr (coercedTo path (src: "${src}") pathInStore);
      default = null;
    };
  };

  imports = [ inputs.base16.nixosModule ];

  config = {
    scheme = cfg.colors;

    fonts.packages = with cfg.fonts; [
      serif.package
      sansSerif.package
      monospace.package
    ];

    environment.variables.XCURSOR_SIZE = lib.toString cfg.cursor.size;
  };
}
