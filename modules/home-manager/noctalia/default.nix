{ lib, ... }:

{
  options.my.noctalia = {
    gpuMonitoring = lib.mkEnableOption ''
      Monitor GPU temperature and VRAM usage.
      Disabled by default so a discrete GPU is not woken on laptops.
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
