{ ... }:

{
  # Enable Niri
  # Installs xdg-desktop-portal-gnome and gnome-keyring as dependencies
  programs.niri.enable = true;

  # Dank Greeter
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";
    # Sync DankMaterialShell theme with the greeter
    configHome = "/home/lucas";
  };
}
