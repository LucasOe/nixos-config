{ inputs, ... }:

{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
    ./colors.nix
  ];

  programs.spicetify = {
    enable = true;
    alwaysEnableDevTools = true;
    experimentalFeatures = true;

    # Custom CSS
    theme.name = "custom";
    theme.src = ./theme;
    theme.homeConfig = false;

    # Extensions
    enabledExtensions = [ ];
  };

  stylix.targets.spicetify = {
    enable = false;
  };
}
