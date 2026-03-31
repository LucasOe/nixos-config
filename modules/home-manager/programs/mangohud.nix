{ config, ... }:

{
  programs.mangohud = {
    enable = true;
    # https://github.com/flightlessmango/Mangohud
    settings = {
      preset = "1,3,4,0";
      background_alpha = 0.8;
      round_corners = 5;
      text_outline = false;
      # Keybinds
      toggle_preset = "Shift_R+F10";
      toggle_hud_position = "Shift_R+F11";
      # Disable unused keybinds
      toggle_hud = "";
      toggle_fps_limit = "";
      toggle_logging = "";
      reload_cfg = "";
      upload_log = "";
      reset_fps_metrics = "";
    };
  };

  stylix.targets.mangohud = {
    enable = true;
    colors.enable = true;
    fonts.enable = false;
    opacity.enable = false;
    colors.override = with config.lib.stylix.colors; {
      base05 = base07; # text_color
    };
  };
}
