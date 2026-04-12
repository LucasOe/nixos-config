{ inputs, pkgs, ... }:

{
  # https://sodiboo.github.io/niri-flake/settings
  imports = [
    inputs.niri.homeModules.config # Import home-manager module
    inputs.niri.homeModules.stylix # Import stylix module
    ./input.nix
    ./keybinds.nix
    ./outputs.nix
    ./rules.nix
    ./settings.nix
  ];

  programs.niri = {
    # Used by niri-flake to validate the config.kdl
    # Should match the NixOS system package
    # Has to be set manual because we don't import the nixosModule from niri-flake
    package = pkgs.niri-unstable;
  };
}
