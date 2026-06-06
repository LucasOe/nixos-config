{
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  noctaliaPkg = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
  cudaSupport = osConfig.nixpkgs.config.cudaSupport or false;
in
{
  options.my.noctalia = {
    gpuMonitoring = lib.mkEnableOption ''
      Monitor GPU temperature and VRAM usage.
      Disabled by default so a discrete GPU is not woken on laptops.
    '';
  };

  imports = [ inputs.noctalia.homeModules.default ];

  config = {
    programs.noctalia = {
      enable = true;
      package = noctaliaPkg.override { cudaSupport = cudaSupport; };
    };

    # Disable GUI/IPC-managed configuration
    home.file.".local/state/noctalia/settings.toml" = {
      force = true;
      text = "";
    };
  };
}
