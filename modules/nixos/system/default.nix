{ pkgs, lib, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    nautilus
    papirus-icon-theme
  ];

  # Fonts
  fonts.packages = with pkgs; [
    inter
    roboto
    roboto-mono
  ];

  programs.dconf.enable = true; # dconf
  programs.seahorse.enable = true; # GNOME Passwords & Key management

  services.flatpak.enable = true; # Flatpak
  services.gvfs.enable = true; # Gnome Virtual File System / Required by Nautilus
  services.playerctld.enable = true; # Media Keys
  services.power-profiles-daemon.enable = true; # Power profile management
  services.printing.enable = true; # Printing
  services.resolved.enable = true; # DNS

  virtualisation.docker.enable = true; # Docker

  # Fix Nautilus error "Your GStreamer installation is missing a plug-in."
  # https://github.com/NixOS/nixpkgs/issues/195936#issuecomment-1278954466
  # https://github.com/NixOS/nixpkgs/issues/53631#issuecomment-3704189416
  environment.sessionVariables.GST_PLUGIN_SYSTEM_PATH_1_0 =
    lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0"
      [
        pkgs.gst_all_1.gst-plugins-good
        pkgs.gst_all_1.gst-plugins-bad
        pkgs.gst_all_1.gst-plugins-ugly
        pkgs.gst_all_1.gst-libav
      ];

  # Allow dynamically linked libraries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc # Required by zed-editor / https://zed.dev/docs/linux
    ];
  };

  # Sudo
  security.sudo.extraConfig = ''
    Defaults pwfeedback # password input feedback - makes typed password visible as asterisks
    Defaults timestamp_timeout=120 # only ask for password every 2h
  '';
}
