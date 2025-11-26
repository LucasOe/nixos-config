{ ... }:

{
  gtk = {
    enable = true;
  };

  stylix.targets = {
    gnome.enable = true; # https://github.com/nix-community/stylix/issues/253
    gtk.enable = true;
  };
}
