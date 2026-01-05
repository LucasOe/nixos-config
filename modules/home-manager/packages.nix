{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Language Server & Formatting
    biome
    nil
    nixd
    nixfmt-rfc-style
    oxfmt
    oxlint
    # Development
    devenv
    # Command Line
    eza
    fd
    jq
    p7zip
    ripgrep
    trashy
    # GNOME Applications
    baobab
    decibels
    gnome-calculator
    gnome-characters
    gnome-connections
    gnome-disk-utility
    gnome-font-viewer
    gnome-logs
    gnome-system-monitor
    loupe
    nautilus
    papers
    showtime
    simple-scan
    snapshot
    # GTK Applications
    eyedropper
    file-roller
    typesetter
    # Other Applications
    obsidian
  ];
}
