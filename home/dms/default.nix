{ inputs, ... }:

{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default # Import home-manager module
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri # Niri Integration
    ./settings.nix
    ./niri.nix
  ];

  programs.dankMaterialShell.enable = true;
}
