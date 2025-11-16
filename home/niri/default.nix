{ inputs, pkgs, ... }:

{
  imports = [
    inputs.niri.homeModules.niri # Import home-manager module
    ./settings.nix
    ./keybinds.nix
    # ./noctalia.nix
    ./rules.nix
    ./autostart.nix
  ];

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
}
