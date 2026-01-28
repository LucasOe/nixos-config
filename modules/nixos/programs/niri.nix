{ inputs, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  # Enable Niri
  programs.niri.enable = true;
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.package = pkgs.niri-unstable;

  # Required by Niri
  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service

  # Disable KDE polkit agent from niri-flake
  systemd.user.services.niri-flake-polkit.enable = false;

  # XDG Portals
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];

    config = {
      common = {
        default = [
          "gtk"
          "gnome"
        ];
      };
      niri = {
        default = [
          "gtk"
          "gnome"
        ];
      };
    };
  };
}
