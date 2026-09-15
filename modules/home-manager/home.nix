{
  lib,
  nixosConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf nixosConfig.my.gui.enable {
    home.packages = with pkgs; [
      baobab
      bazaar
      decibels
      eyedropper
      file-roller
      gnome-calculator
      gnome-characters
      gnome-connections
      gnome-disk-utility
      gnome-font-viewer
      gnome-logs
      loupe
      obsidian
      papers
      refern
      resources
      showtime
      simple-scan
      snapshot
    ];
  };
}
