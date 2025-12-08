{ config, ... }:

{
  programs.zed-editor = {
    # Note: home manager doesn't remove attributes
    userSettings = with config.stylix; {
      # Telemetry
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      # Themes
      theme = "Stylix";
      # Fonts
      buffer_font_family = fonts.monospace.name;
      buffer_font_features = {
        calt = true;
        zero = true;
      };
      # Editor
      features = {
        edit_prediction_provider = "copilot";
      };
      wrap_guides = [
        80
        120
      ];
      # Terminal
      terminal = {
        line_height = "standard";
        cursor_shape = "bar";
        blinking = "on";
      };
    };
  };
}
