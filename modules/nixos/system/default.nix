{ pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Remove default packages
  # https://github.com/NixOS/nixpkgs/issues/263289
  environment.defaultPackages = [ ];

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
  services.printing.enable = true; # Printing
  services.resolved.enable = true; # DNS
  services.upower.enable = true; # D-Bus service for power management

  virtualisation.docker.enable = true; # Docker

  # Allow dynamically linked libraries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc # Required by zed-editor / https://zed.dev/docs/linux
    ];
  };
}
