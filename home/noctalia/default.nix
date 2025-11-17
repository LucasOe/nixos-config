{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default # Import home-manager module
    ./settings.nix
    ./colors.nix
    ./niri.nix
  ];

  programs.noctalia-shell.enable = true;
}
