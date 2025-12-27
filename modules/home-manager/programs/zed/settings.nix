{ config, ... }:

{
  programs.zed-editor = {
    # https://zed.dev/docs/visual-customization
    userSettings = with config.stylix; {
      # Themes
      theme = "Stylix";
      icon_theme = "Colored Zed Icons Theme Dark";
      # UI Font
      ui_font_size = 18;
      # Buffer Font
      buffer_font_family = fonts.monospace.name;
      buffer_font_size = 15;
      buffer_line_height.custom = 1.4;
      buffer_font_features = {
        calt = true;
        zero = true;
      };
      # Titlebar
      window_decorations = "server";
      title_bar = {
        show_branch_icon = true;
        show_user_picture = false;
      };
      # Workspace Resoration
      session.restore_unsaved_buffers = false;
      restore_on_startup = "none";
      # Telemetry
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      # Editor
      format_on_save = "off"; # We override this either per language or per project
      hard_tabs = true;
      tab_size = 4;
      wrap_guides = [
        80
        120
      ];
      # Prettier
      prettier = {
        allowed = false;
      };
      # Inline Diagnostics
      diagnostics = {
        inline.enabled = true;
      };
      # Editor Toolbar
      toolbar = {
        agent_review = false;
      };
      # Editor Tabs
      tabs = {
        git_status = true;
        show_close_button = "always";
      };
      # Editor Completions, Snippets, Actions, Diagnostics
      inline_code_actions = false;
      # Edit Predictions
      features.edit_prediction_provider = "none";
      edit_predictions.mode = "subtle";
      edit_predictions.enabled_in_text_threads = false;
      show_edit_predictions = false;
      # Editor Inlay Hints
      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = false;
        show_other_hints = true;
      };
      # Project Panel
      project_panel = {
        default_width = 300;
      };
      # Agent Panel
      agent = {
        enable_feedback = false;
        use_modifier_to_send = true;
        default_model = {
          provider = "copilot_chat";
          model = "gpt-5-mini";
        };
      };
      # Terminal Panel
      terminal = {
        blinking = "on";
        cursor_shape = "bar";
        line_height = "standard";
      };
      # Collaboration Panels
      collaboration_panel = {
        button = false;
      };
    };
  };
}
