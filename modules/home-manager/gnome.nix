{
  config,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.gnome;
in
{
  options.my.gnome = {
    enable = lib.mkEnableOption "GNOME Apps" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };
  };

  config = lib.mkIf cfg.enable {
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
    ];
  };
}
