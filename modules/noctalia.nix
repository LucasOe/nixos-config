{ ... }:

{
  # Enable Niri
  programs.niri.enable = true;

  # Enable GDM Display Manager
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";
}
