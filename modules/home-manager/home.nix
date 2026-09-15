{ pkgs, ... }:

{
  # Environment variables
  home.sessionVariables = {
    NODE_OPTIONS = "--no-deprecation";
    PROTON_PASS_LINUX_KEYRING = "dbus"; # https://protonpass.github.io/pass-cli/get-started/configuration/#secure-key-storage
  };

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    baobab
    bazaar
    biome
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
    nautilus
    nil
    nixd
    nixfmt
    obsidian
    oxfmt
    oxlint
    p7zip
    papers
    proton-pass-cli
    refern
    resources
    showtime
    simple-scan
    snapshot
    sqlite
    stylua
    trashy
    typesetter
    wl-clipboard-rs
  ];
}
