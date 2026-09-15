{
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cliPackages = with pkgs; [
    biome
    nil
    nixd
    nixfmt
    oxfmt
    oxlint
    sqlite
    stylua
    trashy
  ];

  guiPackages = with pkgs; [
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
in
{
  home.packages = cliPackages ++ lib.optionals nixosConfig.my.gui.enable guiPackages;
}
