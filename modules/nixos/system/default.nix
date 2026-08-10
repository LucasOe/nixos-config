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

  hardware.bluetooth.enable = true;

  programs.dconf.enable = true;
  programs.seahorse.enable = true;

  services.flatpak.enable = true;
  services.gvfs.enable = true;
  services.playerctld.enable = true;
  services.printing.enable = true;
  services.resolved.enable = true;
  services.upower.enable = true;

  virtualisation.docker.enable = true; # Docker

  # Allow dynamically linked libraries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc # Required by zed-editor / https://zed.dev/docs/linux
    ];
  };

  # Disable speechd/Speech Dispatcher (enabled by services.graphical-desktop.enable)
  services.speechd.enable = false;
}
