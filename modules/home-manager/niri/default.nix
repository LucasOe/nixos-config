{
  inputs,
  lib,
  pkgs,
  ...
}:

{
  options.my.niri = {
    environment = lib.mkOption {
      type = lib.types.enum [
        "noctalia"
        "dms"
      ];
      default = "noctalia";
      description = "Desktop Environment";
    };
  };

  imports = [
    inputs.niri-nix.homeModules.default # Import home-manager module
    inputs.niri-nix.homeModules.stylix # Import stylix module
  ];

  config = {
    # https://codeberg.org/BANanaD3V/niri-nix/src/branch/main/home-options.md
    wayland.windowManager.niri = {
      enable = true;
      package = pkgs.niri-unstable; # We are using the NixOS module to install niri
    };

    stylix.targets.niri = {
      enable = true;
    };
  };
}
