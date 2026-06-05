{ inputs, lib, ... }:

{
  # Monitor GPU temperature and VRAM usage. Disabled by default so a discrete GPU is not woken on laptops.
  options.my.noctalia = {
    gpuMonitoring = lib.mkEnableOption "Monitor GPU";
  };

  imports = [ inputs.noctalia.homeModules.default ];

  config = {
    programs.noctalia = {
      enable = true;
    };

    # Reset settings on activation
    home.file.".local/state/noctalia/settings.toml" = {
      force = true;
      text = "";
    };
  };
}
