{ ... }:

{
  # Enable Niri
  # Installs xdg-desktop-portal-gnome and gnome-keyring as dependencies
  programs.niri.enable = true;

  # Enable GDM Display Manager
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";
}
