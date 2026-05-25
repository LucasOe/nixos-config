{
  config,
  inputs,
  lib,
  ...
}:

let
  cfg = config.my.maccel;
in
{
  options.my.maccel = {
    enable = lib.mkEnableOption "maccel";
  };

  imports = [ inputs.maccel.nixosModules.default ];

  config = lib.mkIf cfg.enable {
    # https://github.com/Gnarus-G/maccel/blob/main/README_NIXOS.md
    hardware.maccel = {
      enable = true;
      enableCli = true;

      parameters = {
        sensMultiplier = 0.50;
        inputDpi = 1600.0;

        mode = "linear";
        acceleration = 0.02;
        offset = 5.0;
        outputCap = 2.0;
      };
    };
  };
}
