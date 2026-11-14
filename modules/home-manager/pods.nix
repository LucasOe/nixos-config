{
  config,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.pods;
in
{
  options.my.pods = {
    enable = lib.mkEnableOption "Pods" // {
      default = nixosConfig.my.gui.enable && nixosConfig.my.docker.enable;
      defaultText = lib.literalExpression "nixosConfig.my.gui.enable && nixosConfig.my.docker.enable";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.pods ];

    xdg.configFile."pods/connections.json".text = builtins.toJSON {
      "28a71bb3-7ea8-4585-9672-ca887cd29d9a" = {
        uuid = "28a71bb3-7ea8-4585-9672-ca887cd29d9a";
        name = "localhost";
        url = "tcp://127.0.0.1:2375";
        rgb = null;
      };
    };
  };
}
