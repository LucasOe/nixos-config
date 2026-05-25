{ config, ... }:

{
  gtk = {
    enable = true;

    # TODO: Remove when this upstream issue is resolved:
    # https://github.com/nix-community/stylix/issues/2250
    gtk4.theme = config.gtk.theme;
  };

  stylix.targets = {
    gtk.enable = true;
  };

  dconf.settings = {
    # Hide recent files from Nautilus
    "org/gnome/desktop/privacy".remember-recent-files = false;
    # Firefox uses dconf color scheme
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
  };
}
