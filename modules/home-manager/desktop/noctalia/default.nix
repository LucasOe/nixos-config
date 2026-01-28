{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default # Import home-manager module
    ./colors.nix
    ./niri.nix
    ./settings.nix
  ];

  programs.noctalia-shell.enable = true;
  services.polkit-gnome.enable = true;

  stylix.targets.noctalia-shell = {
    enable = true;
  };
}
