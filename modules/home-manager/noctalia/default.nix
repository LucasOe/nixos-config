{
  config,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.noctalia;
in
{
  options.my.noctalia = {
    enable = lib.mkEnableOption "Noctalia" // {
      default = nixosConfig.my.gui.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable";
    };

    gpuMonitoring = lib.mkEnableOption ''
      Bar widgets for GPU temperature and VRAM usage.
    '';
  };

  config = lib.mkIf cfg.enable {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
    };

    # Disable GUI/IPC-managed configuration
    xdg.stateFile."noctalia/settings.toml" = {
      force = true;
      text = "";
    };

    home.packages = with pkgs; [
      wl-mirror # Required by elijaharch/wl-screen-mirror
    ];
  };
}
