{ inputs, username, ... }:

{
  imports = [
    inputs.dankMaterialShell.nixosModules.greeter
  ];

  # Dank Greeter
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";
    # Sync DankMaterialShell theme with the greeter
    configHome = "/home/${username}";
  };
}
