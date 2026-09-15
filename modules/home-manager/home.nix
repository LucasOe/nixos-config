{
  lib,
  nixosConfig,
  pkgs,
  ...
}:

{
  config = lib.mkIf nixosConfig.my.gui.enable {
    home.packages = with pkgs; [
      # Gnome Core Apps
      baobab # Disk Usage Analyzer
      decibels # Audio Player
      file-roller # File Roller
      gnome-calculator # Calculator
      gnome-characters # Character
      gnome-connections # Connections
      gnome-disk-utility # Disks
      gnome-font-viewer # Fonts
      gnome-logs # Logs
      loupe # Image Viewer
      papers # Document Viewer
      showtime # Video Player
      simple-scan # Document Scanner
      snapshot # Camera

      # Gnome Circle Apps
      bazaar
      eyedropper
      resources

      # Other
      obsidian
      refern
    ];
  };
}
