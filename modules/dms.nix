{ ... }:

{
  # Enable Niri
  programs.niri.enable = true;

  # Dank Greeter
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";
    # Sync DankMaterialShell theme with the greeter
    configHome = "/home/lucas";
  };
}
