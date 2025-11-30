{ inputs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri # Import home-manager module
    ./settings.nix
    ./keybinds.nix
    ./rules.nix
  ];
}
