{ nixosConfig, ... }:

{
  programs.mangohud = with nixosConfig.theme.colors; {
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
      # FPS Limit
      # https://www.reddit.com/r/nvidia/s/eeiXz0R43U
      fps_limit = 138;
      vsync = 2; # Mailbox (VSync with uncapped FPS)

      # Theme
      text_color = base07;
      text_outline_color = base00;
      background_color = base00;
      gpu_color = base0B;
      cpu_color = base0D;
      vram_color = base0C;
      media_player_color = base07;
      engine_color = base0E;
      wine_color = base0E;
      frametime_color = base0B;
      battery_color = base04;
      io_color = base0A;
      gpu_load_color = "${base0B}, ${base0A}, ${base08}";
      cpu_load_color = "${base0B}, ${base0A}, ${base08}";
      fps_color = "${base0B}, ${base0A}, ${base08}";
    };
  };
}
