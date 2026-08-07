{
  config,
  nixosConfig,
  pkgs,
  ...
}:

let
  gtkTheme = nixosConfig.theme.colors {
    template = ./theme.css.mustache;
    extension = ".css";
  };
in
{
  gtk = {
    enable = true;

    gtk3.theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
    gtk4.theme = null; # Silence warning for `home.stateVersion` less than 26.05
    gtk3.extraCss = ''@import url("file://${gtkTheme}");'';
    gtk4.extraCss = ''@import url("file://${gtkTheme}");'';

    font = {
      package = nixosConfig.theme.fonts.sansSerif.package;
      name = nixosConfig.theme.fonts.sansSerif.name;
    };

    cursorTheme = {
      package = nixosConfig.theme.cursor.package;
      name = nixosConfig.theme.cursor.name;
      size = nixosConfig.theme.cursor.size;
    };

    iconTheme = {
      package = nixosConfig.theme.icons.package;
      name = nixosConfig.theme.icons.name;
    };
  };

  dconf.settings = {
    # Hide recent files from Nautilus
    "org/gnome/desktop/privacy".remember-recent-files = false;
    # Firefox uses dconf color scheme
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    # Disable maximize on title bar double-click
    "org/gnome/desktop/wm/preferences".action-double-click-titlebar = "none";
  };

  # Allow flatpaks to use the theme
  # https://github.com/flatpak/flatpak/issues/3901
  xdg.dataFile."flatpak/overrides/global".text =
    let
      dirs = [
        "/nix/store:ro"
        "xdg-config/gtk-3.0:ro"
        "xdg-config/gtk-4.0:ro"
        "${config.xdg.dataHome}/.icons:ro"
        "${config.xdg.dataHome}/.themes:ro"
      ];
    in
    ''
      [Context]
      filesystems=${builtins.concatStringsSep ";" dirs}
    '';
}
