{ lib, ... }:

{
  options.my.noctalia = {
    gpuMonitoring = lib.mkEnableOption ''
      Bar widgets for GPU temperature and VRAM usage.
    '';
  };

  config = {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
    };

    # Disable GUI/IPC-managed configuration
    home.file.".local/state/noctalia/settings.toml" = {
      force = true;
      text = "";
    };
  };
}
