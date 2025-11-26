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
    loupe
    nautilus
    papers
    showtime
    gnome-text-editor
  ];
}
