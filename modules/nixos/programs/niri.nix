{ pkgs, ... }:

{
  programs.niri = {
    enable = true;
  };

  # XDG Desktop Portal
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
}
