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
    proton-pass-cli
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
  # Environment variables
  home.sessionVariables = {
    NODE_OPTIONS = "--no-deprecation";
    PROTON_PASS_LINUX_KEYRING = "dbus"; # https://protonpass.github.io/pass-cli/get-started/configuration/#secure-key-storage
  };

  # Packages that should be installed to the user profile
  home.packages = cliPackages ++ lib.optionals nixosConfig.my.gui.enable guiPackages;
}
