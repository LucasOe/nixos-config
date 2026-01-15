{ ... }:

{
  gtk = {
    enable = true;
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
