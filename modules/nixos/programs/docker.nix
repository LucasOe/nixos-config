{ config, lib, ... }:

let
  cfg = config.my.docker;
in
{
  options.my.docker = {
    enable = lib.mkEnableOption "Docker" // {
      default = true;
      defaultText = lib.literalExpression "true";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = false; # Disable the system wide Docker daemon
      rootless = {
        enable = true;
        setSocketVariable = true;
        daemon.settings = {
          # Enable remote-access
          # See: https://docs.docker.com/engine/daemon/remote-access/
          hosts = [
            "unix:///run/user/1000/docker.sock"
            "tcp://127.0.0.1:2375"
          ];
        };
      };
    };
  };
}
