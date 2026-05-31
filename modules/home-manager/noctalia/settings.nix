{ config, configLib, ... }:

{
  programs.noctalia = {
    # https://docs.noctalia.dev/v5/configuration/
    settings = {
      theme = {
        community_palette = "One";
        source = "community";
        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };
      # https://github.com/iStellanova/Stellyrland/blob/827773060acf6cdd36a85f3ff78e087e2dffed3c/modules/programs/noctalia/default.nix#L41
      wallpaper = {
        enabled = true;
        directory = configLib.relativeToRoot "assets/wallpapers";
        fill_color = config.lib.stylix.colors.withHashtag.base00;
        fill_mode = "fit";
        transition = [ "wipe" ];
        monitors = {
          "DP-1".path = config.stylix.image;
          "DP-2".path = config.stylix.image;
          "eDP-1".path = config.stylix.image;
        };
      };
      control_center = {
        sidebar = "none";
        shortcuts = [
          { type = "wifi"; }
          { type = "bluetooth"; }
          { type = "nightlight"; }
          { type = "notification"; }
        ];
      };
      desktop_widgets = {
        enabled = false;
      };
      shell = {
        avatar_path = configLib.relativeToRoot "assets/avatars/tamas.png";
        corner_radius_scale = 0.5;
        date_format = "{:%A, %b %d}"; # https://docs.noctalia.dev/v5/configuration/date-format-tokens/
        font_family = config.stylix.fonts.monospace;
        middle_click_opens_widget_settings = false;
        polkit_agent = true;
        panel = {
          launcher_categories = false;
          open_near_click_control_center = true;
          session_placement = "centered";
          wallpaper_placement = "centered";
        };
        screenshot = {
          freeze_screen = true;
        };
        session.actions = [
          {
            action = "lock";
            enabled = true;
            shortcut = "1";
            variant = "default";
          }
          {
            action = "logout";
            enabled = true;
            shortcut = "2";
            variant = "default";
          }
          {
            action = "suspend";
            enabled = false;
            shortcut = "3";
            variant = "default";
          }
          {
            action = "reboot";
            enabled = true;
            shortcut = "4";
            variant = "default";
          }
          {
            action = "shutdown";
            enabled = true;
            shortcut = "5";
            variant = "destructive";
          }
        ];
      };
      weather = {
        address = "Hamm, Germany";
        effects = false;
      };
      notification = {
        background_opacity = 1.0;
        monitors = [ "DP-1" ];
        offset_x = 16.0;
        offset_y = 16.0;
      };
      osd = {
        background_opacity = 1.0;
        monitors = [ "DP-1" ];
        offset_x = 16.0;
        offset_y = 16.0;
      };
      bar = {
        default = {
          monitor = {
            "DP-1" = {
              enabled = false;
            };
          };
          capsule = true;
          capsule_groups = [
            "Date Time"
            "Volume"
            "System Monitor"
          ];
          capsule_radius = 8.0;
          margin_edge = 0.0;
          margin_ends = 0.0;
          padding = 4;
          radius = 0;
          widget_spacing = 8;
          capsule_group = [
            {
              id = "g1";
              members = [
                "cpu"
                "temp"
                "ram"
              ];
            }
            {
              id = "g2";
              members = [
                "input_volume"
                "output_volume"
              ];
            }
            {
              id = "g3";
              members = [
                "clock"
                "date"
              ];
            }
          ];
          start = [
            "control-center"
            "group:g1"
            "media"
          ];
          center = [
            "taskbar"
          ];
          end = [
            "tray"
            "Space"
            "lock_keys"
            "notifications"
            "bluetooth"
            "network"
            "battery"
            "brightness"
            "group:g2"
            "Space"
            "group:g3"
          ];
        };
      };
      widget = {
        space = {
          type = "spacer";
        };
        control-center = {
          capsule = true;
          glyph = "settings";
        };
        media = {
          capsule = true;
          hide_when_no_media = true;
        };
        cpu = {
          capsule = true;
          capsule_group = "System Monitor";
          display = "text";
        };
        temp = {
          capsule = true;
          capsule_group = "System Monitor";
          display = "text";
        };
        ram = {
          capsule = true;
          capsule_group = "System Monitor";
          display = "text";
        };
        taskbar = {
          capsule = true;
          capsule_opacity = 0.0;
          capsule_padding = 16.0;
          empty_color = "outline";
          group_by_workspace = true;
          hide_empty_workspaces = true;
          inactive_opacity = 0.75;
          occupied_color = "outline";
          scale = 1.2;
          show_active_indicator = false;
          show_all_outputs = true;
          workspace_group_capsule = false;
          workspace_label_placement = "centered";
        };
        tray = {
          capsule = true;
          hidden = [
            "nm-applet"
          ];
        };
        battery = {
          capsule = true;
        };
        bluetooth = {
          capsule = true;
        };
        brightness = {
          capsule = true;
        };
        lock_keys = {
          capsule = true;
          display = "full";
          hide_when_off = true;
          show_scroll_lock = true;
        };
        notifications = {
          capsule = true;
        };
        network = {
          capsule = true;
          show_label = false;
        };
        input_volume = {
          capsule = true;
          capsule_group = "Volume";
          show_label = false;
        };
        output_volume = {
          capsule = true;
          capsule_group = "Volume";
          show_label = false;
        };
        date = {
          capsule = true;
          capsule_group = "Date Time";
          format = "{:%a, %b %d}"; # https://docs.noctalia.dev/v5/configuration/date-format-tokens/
        };
        clock = {
          capsule = true;
          capsule_group = "Date Time";
        };
      };
    };
  };
}
