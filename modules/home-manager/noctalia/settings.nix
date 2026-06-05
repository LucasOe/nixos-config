{
  config,
  configLib,
  lib,
  ...
}:

let
  cfg = config.my.noctalia;
  gaps = config.wayland.windowManager.niri.settings.layout.gaps;
in
{
  programs.noctalia = {
    # https://docs.noctalia.dev/v5/configuration/
    # https://github.com/noctalia-dev/noctalia-shell/blob/v5/example.toml
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
        sidebar_section = "none";
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
        launch_apps_as_systemd_services = true;
        middle_click_opens_widget_settings = false;
        polkit_agent = true;
        panel = {
          launcher_categories = false;
          open_near_click_control_center = true;
          session_placement = "centered";
          wallpaper_placement = "centered";
        };
        settings_show_advanced = true;
        setup_wizard_enabled = false;
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
      system = {
        monitor = {
          gpu_poll_seconds = lib.mkIf cfg.gpuMonitoring 5;
        };
      };
      weather = {
        effects = false;
      };
      location = {
        address = "Hamm, Germany";
      };
      notification = {
        background_opacity = 1.0;
        monitors = [ "DP-1" ];
        offset_x = gaps;
        offset_y = gaps;
        position = "top_right";
      };
      osd = {
        background_opacity = 1.0;
        monitors = [ "DP-1" ];
        offset_x = gaps;
        offset_y = gaps;
        position = "top_right";
      };
      lockscreen = {
        blur_intensity = 0.0;
        tint_intensity = 0.0;
      };
      bar = {
        default = {
          monitor = {
            "DP-2" = {
              enabled = false;
            };
          };
          capsule = true;
          capsule_radius = 8.0;
          margin_edge = 0.0;
          margin_ends = 0.0;
          padding = 4;
          radius = 0;
          widget_spacing = 8;
          capsule_group = [
            {
              id = "cpu";
              members = [
                "cpu_usage"
                "cpu_temp"
                "ram_used"
              ];
            }
            {
              id = "gpu";
              members = lib.mkIf cfg.gpuMonitoring [
                "gpu_usage"
                "gpu_temp"
                "gpu_vram"
              ];
            }
            {
              id = "volume";
              members = [
                "input_volume"
                "output_volume"
              ];
            }
            {
              id = "time";
              members = [
                "clock"
                "date"
              ];
            }
          ];
          start = [
            "control-center"
            "group:cpu"
            "group:gpu"
            "media"
          ];
          center = [
            "taskbar"
          ];
          end = [
            "tray"
            "lock_keys"
            "notifications"
            "bluetooth"
            "network"
            "battery"
            "brightness"
            "group:volume"
            "group:time"
          ];
        };
      };
      widget = {
        control-center = {
          capsule = true;
          glyph = "settings";
        };
        media = {
          capsule = true;
          hide_when_no_media = true;
        };
        cpu_usage = {
          capsule = true;
          display = "text";
          stat = "cpu_usage";
          type = "sysmon";
        };
        cpu_temp = {
          capsule = true;
          display = "text";
          stat = "cpu_temp";
          type = "sysmon";
        };
        ram_used = {
          capsule = true;
          display = "text";
          stat = "ram_used";
          type = "sysmon";
        };
        gpu_usage = {
          capsule = true;
          display = "text";
          stat = "gpu_usage";
          type = "sysmon";
        };
        gpu_temp = {
          capsule = true;
          display = "text";
          stat = "gpu_temp";
          type = "sysmon";
        };
        gpu_vram = {
          capsule = true;
          display = "text";
          stat = "gpu_vram";
          type = "sysmon";
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
          show_label = false;
        };
        brightness = {
          capsule = true;
          show_label = false;
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
          show_label = false;
        };
        output_volume = {
          capsule = true;
          show_label = false;
        };
        date = {
          capsule = true;
          format = "{:%a, %b %d}"; # https://docs.noctalia.dev/v5/configuration/date-format-tokens/
        };
        clock = {
          capsule = true;
        };
      };
    };
  };
}
