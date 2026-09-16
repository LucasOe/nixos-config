{
  config,
  lib,
  nixosConfig,
  ...
}:

let
  cfg = config.my.fish;
in
{
  options.my.fish = {
    enable = lib.mkEnableOption "fish" // {
      default = nixosConfig.programs.fish.enable;
      defaultText = lib.literalExpression "nixosConfig.programs.fish.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.fish = {
      enable = true;

      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
    };
  };
}
