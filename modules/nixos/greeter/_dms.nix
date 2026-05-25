{ username, ... }:

{
  # Dank Greeter
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";
    # Sync DankMaterialShell theme with the greeter
    configHome = "/home/${username}";
  };
}
