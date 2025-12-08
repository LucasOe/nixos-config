{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Language Server & Formatting
    nixfmt-rfc-style
    nixd
    # Development
    devenv
    # Command Line
    eza
    fd
    jq
    ripgrep
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
    gnome-text-editor
    loupe
    nautilus
    papers
    showtime
    simple-scan
    snapshot
    # GNOME Circle Applications
    eyedropper
  ];
}
