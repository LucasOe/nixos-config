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
    enabledExtensions = [
      {
        src = "${inputs.spicetify-genres}/dist";
        name = "whatsThatGenre.js";
      }
      {
        src = "${inputs.spicetify-utilities}";
        name = "utilities.js";
      }
    ];
  };

  stylix.targets.spicetify = {
    enable = false;
  };
}
