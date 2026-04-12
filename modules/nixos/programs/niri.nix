{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  # Enable Niri
  programs.niri.enable = true;
  # package gets overwritten by niri-flake
  # https://github.com/sodiboo/niri-flake/blob/f943da038fd668d435c2d17916577f295faa8839/flake.nix#L428
  programs.niri.package = pkgs.niri;

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
  };
}
