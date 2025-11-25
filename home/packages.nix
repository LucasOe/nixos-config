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
    bat
    eza
    fd
    jq
    ripgrep
    # GNOME Applications
    nautilus
    loupe
    showtime
    decibels
    gnome-text-editor
  ];
}
