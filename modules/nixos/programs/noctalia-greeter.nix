{
  config,
  inputs,
  lib,
  pkgs,
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
      package = pkgs.noctalia-greeter;

      settings = {
        session = {
          default = "niri";
        };
        user = {
          default = username;
        };
        appearance = {
          # scheme = "Synced";
          hide_logo = true;
          corner_radius_scale = 0.5;
          font_family = config.theme.fonts.sansSerif.name;
          palette = with config.theme.colors.withHashtag; {
            primary = base0D;
            on_primary = base00;
            secondary = base0E;
            on_secondary = base00;
            tertiary = base0B;
            on_tertiary = base00;
            error = base08;
            on_error = base00;
            surface = base00;
            on_surface = base07;
            surface_variant = base01;
            on_surface_variant = base05;
            outline = base02;
            shadow = base00;
            hover = base0B;
            on_hover = base00;
          };
        };
        output = {
          name = cfg.output.name;
          layout = cfg.output.layout;
          transforms = cfg.output.transforms;
        };
        cursor = {
          theme = config.theme.cursor.name;
          size = config.theme.cursor.size;
          path = "${config.theme.cursor.package}/share/icons";
        };
        keyboard = {
          layout = config.services.xserver.xkb.layout;
          variant = config.services.xserver.xkb.variant;
          options = config.services.xserver.xkb.options;
          numlock = false;
        };
      };
    };

    # Set profile picture for AccountService
    systemd.tmpfiles.rules = lib.mkIf (config.theme.avatar != null) [
      "f+ /var/lib/AccountsService/users/${username}  0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${username}\\n"
      "L+ /var/lib/AccountsService/icons/${username}  - - - - ${config.theme.avatar}"
    ];
  };
}
