{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome-text-editor
  ];

  stylix.targets = {
    gnome-text-editor.enable = true;
    gtksourceview.enable = true;
  };
}
