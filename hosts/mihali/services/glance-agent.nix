{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.glance-agent;
in
{
  options.my.glance-agent = {
    port = lib.mkOption {
      description = "Glance Agent port to listen on";
      default = 27973;
      example = 27973;
      type = lib.types.port;
    };
  };

  config = {
    systemd.services.glance-agent = {
      description = "Glance Agent Service";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      environment = {
        PORT = "${lib.toString cfg.port}";
      };

      serviceConfig = {
        ExecStart = "${lib.getExe pkgs.glance-agent}";
        Restart = "on-failure";
      };
    };

    networking.firewall.allowedTCPPorts = [ cfg.port ];
  };
}
