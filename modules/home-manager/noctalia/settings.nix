{
  config,
  configLib,
  ...
}:

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
      wallpaper = {
        enabled = false;
        wallpaper.monitors =
          let
            color = "color:#${config.lib.stylix.colors.base00}";
          in
          {
            "DP-1" = color;
            "DP-2" = color;
            "eDP-1" = color;
          };
      };
      control_center = {
        sidebar = "none";
        shortcuts = [
          "wifi"
          "bluetooth"
          "nightlight"
          "notification"
        ];
      };
      desktop_widgets = {
        enabled = false;
      };
      shell = {
        avatar_path = configLib.relativeToRoot "assets/avatars/tamas.png";
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
        monitors = [ "DP-2" ];
        offset_x = 16.0;
        offset_y = 16.0;
      };
      osd = {
        background_opacity = 1.0;
        monitors = [ "DP-2" ]; # Not available
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
          start = [
            "control-center"
            "cpu"
            "temp"
            "ram"
            "media"
          ];
          center = [
            "taskbar"
          ];
          end = [
            "tray"
            "Space"
            "battery"
            "bluetooth"
            "brightness"
            "lock_keys"
            "notifications"
            "network"
            "input_volume"
            "output_volume"
            "Space"
            "clock"
            "date"
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
