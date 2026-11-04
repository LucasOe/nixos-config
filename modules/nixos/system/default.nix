{ config, pkgs, ... }:

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
  hardware.enableAllFirmware = true;
  hardware.enableAllHardware = true;

  programs.comma.enable = true;
  programs.dconf.enable = true;

  services.flatpak.enable = config.my.gui.enable;
  services.playerctld.enable = true;
  services.printing.enable = true;
  services.upower.enable = true;

  # Allow dynamically linked libraries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc # Required by zed-editor / https://zed.dev/docs/linux
    ];
  };

  # Disable speechd/Speech Dispatcher (enabled by services.graphical-desktop.enable)
  services.speechd.enable = false;

  # Disable HTML docs and info, man pages are enough
  documentation = {
    doc.enable = false;
    info.enable = false;
  };

  # Use scx_lavd scheduler
  services.scx = {
    enable = true;
    scheduler = "scx_lavd";
    # Automatically decide the scheduler's power mode (performance vs.
    # powersave vs. balanced) based on the system's active power profile.
    extraArgs = [ "--autopower" ];
  };

  # Use latest kernel version
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Install terminfo outputs
  # environment.enableAllTerminfo = true;
  environment.systemPackages = with pkgs; [
    ghostty.terminfo
    kitty.terminfo
  ];

  # Remove perl from activation
  #
  # /etc/ isn't automatically migrated to /.rw-etc/upper
  # See: https://github.com/NixOS/nixpkgs/issues/319524
  system.etc.overlay.enable = true;
  services.userborn.enable = true;
}
