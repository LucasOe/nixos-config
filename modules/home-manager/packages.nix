{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Language Server & Formatting
    biome
    nil
    nixd
    nixfmt
    oxfmt
    oxlint
    stylua
    # Command Line
    eza
    fd
    jq
    p7zip
    ripgrep
    trashy
    wl-clipboard-rs
    # GNOME Applications
    baobab
    decibels
    gnome-calculator
    gnome-characters
    gnome-connections
    gnome-disk-utility
    gnome-font-viewer
    gnome-logs
    loupe
    nautilus
    papers
    resources
    showtime
    simple-scan
    snapshot
    # GTK Applications
    bazaar
    eyedropper
    file-roller
    typesetter
    # Other Applications
    gpu-screen-recorder
    obsidian
    proton-pass-cli
  ];
}
