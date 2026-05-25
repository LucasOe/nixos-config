{
  config,
  lib,
  username,
  ...
}:

let
  cfg = config.my.displayManager.dms;
in
{
  options.my.displayManager.dms = {
    enable = lib.mkEnableOption "DMS";
  };

  config = lib.mkIf cfg.enable {
    services.displayManager.dms-greeter = {
      enable = true;
      compositor.name = "niri";
      # Sync DankMaterialShell theme with the greeter
      configHome = "/home/${username}";
    };
  };
}
