{
  config,
  inputs,
  lib,
  username,
  ...
}:

let
  cfg = config.my.noctalia-greeter;
in
{
  options.my.noctalia-greeter = {
    output = {
      name = lib.mkOption {
        type = lib.types.str;
        default = "";
        example = "DP-1";
        description = "Pin the greeter to one connector; omit to mirror on every monitor.";
      };

      layout = lib.mkOption {
        type = lib.types.str;
        default = "";
        example = "DP-1:0,0; DP-2:2560,0";
        description = "Multi-monitor positions (logical pixels).";
      };

      transforms = lib.mkOption {
        type = lib.types.str;
        default = "";
        example = "DP-1:normal; DP-2:normal";
        description = ''
          Per-connector DRM transform.
          Tokens: normal/0/none, 90, 180, 270, flipped, flipped-90, flipped-180, flipped-270
        '';
      };
    };
  };

  imports = [ inputs.noctalia-greeter.nixosModules.default ];

  config = {
    programs.noctalia-greeter = {
      enable = true;

      settings = {
        session = {
          default = "niri";
        };
        user = {
          default = username;
        };
        appearance = {
          scheme = "Synced";
          hide_logo = true;
          corner_radius_scale = 0.5;
          font_family = config.stylix.fonts.sansSerif.name;
        };
        output = {
          name = cfg.output.name;
          layout = cfg.output.layout;
          transforms = cfg.output.transforms;
        };
        cursor = {
          theme = config.stylix.cursor.name;
          size = config.stylix.cursor.size;
          path = "${config.stylix.cursor.package}/share/icons";
        };
        keyboard = {
          layout = config.services.xserver.xkb.layout;
          variant = config.services.xserver.xkb.variant;
          options = config.services.xserver.xkb.options;
          numlock = false;
        };
      };
    };
  };
}
