{
  lib,
  pkgs,
  username,
  ...
}:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Enable fontconfig configuration
  fonts.fontconfig.enable = true;

  # Environment variables
  home.sessionVariables = {
    NODE_OPTIONS = "--no-deprecation";
    PROTON_PASS_LINUX_KEYRING = "dbus"; # https://protonpass.github.io/pass-cli/get-started/configuration/#secure-key-storage

    # Fix Nautilus error "Your GStreamer installation is missing a plug-in."
    # https://github.com/NixOS/nixpkgs/issues/195936#issuecomment-1278954466
    # https://github.com/NixOS/nixpkgs/issues/53631#issuecomment-3704189416
    GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" [
      pkgs.gst_all_1.gst-plugins-good
      pkgs.gst_all_1.gst-plugins-bad
      pkgs.gst_all_1.gst-plugins-ugly
      pkgs.gst_all_1.gst-libav
    ];
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
