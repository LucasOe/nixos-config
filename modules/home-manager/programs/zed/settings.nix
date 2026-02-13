{ config, ... }:

{
  programs.zed-editor = {
    # https://zed.dev/docs/visual-customization
    userSettings = with config.stylix; {
      # General -> Workspace Restoration
      session.restore_unsaved_buffers = false;
      restore_on_startup = "launchpad"; # https://github.com/zed-industries/zed/issues/47075
      # General -> Privacy
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      # Apperance -> Theme
      theme = "Stylix";
      icon_theme = "Colored Zed Icons Theme Dark";
      # Apperance -> Buffer Font
      buffer_font_family = fonts.monospace.name;
      buffer_font_size = 15;
      buffer_line_height.custom = 1.4;
      buffer_font_features = {
        calt = true; # https://github.com/zed-industries/zed/pull/48504
        zero = true;
      };
      # Apperance -> UI Font
      ui_font_size = 18;
      # Editor -> Gutter
      inline_code_actions = false;
      # Editor -> Toolbar
      toolbar = {
        agent_review = false;
      };
      # Editor -> Indentation
      tab_size = 4;
      hard_tabs = true;
      # Editor -> Wrapping
      wrap_guides = [
        80
        120
      ];
      # Editor -> Formatting
      format_on_save = "off"; # We override this either per language or per project
      # Editor -> Inlay Hints
      inlay_hints = {
        enabled = false; # We override this per language
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
      };
      # Languages & Tools -> Prettier
      prettier = {
        allowed = false;
      };
      # Languages & Tools -> Inline Diagnostics
      diagnostics = {
        inline.enabled = true;
      };
      # Search & Files
      file_scan_exclusions = [
        # Defaults
        "**/.classpath"
        "**/.DS_Store"
        "**/.git"
        "**/.hg"
        "**/.jj"
        "**/.settings"
        "**/.svn"
        "**/CVS"
        "**/Thumbs.db"
        # Nix
        "**/.direnv"
        # JavaScript
        "**/node_modules"
      ];
      # Window & Layout -> Title Bar
      title_bar = {
        show_branch_icon = true;
        show_user_picture = false;
      };
      # Window & Layout -> Tab Bar
      tabs = {
        git_status = true;
      };
      # Window & Layout -> Window
      window_decorations = "server";
      # Panels -> Project Panel
      project_panel = {
        default_width = 300;
      };
      # Panels -> Git Panel
      git_panel = {
        tree_view = true;
      };
      # Panels -> Collaboration Panels
      collaboration_panel = {
        button = false;
      };
      # Terminal
      terminal = {
        line_height = "standard";
        cursor_shape = "bar";
        blinking = "on";
      };
      # Version Control
      git = {
        inline_blame = {
          enabled = true;
          min_column = 80;
        };
      };
      # AI -> Agent Configuration
      agent = {
        enable_feedback = false;
        default_model = {
          provider = "copilot_chat";
          model = "gpt-5-mini";
        };
      };
      # AI -> Edit Predictions
      show_edit_predictions = false;
      edit_predictions.provider = "copilot"; # Nightly
      edit_predictions.mode = "subtle";
      edit_predictions.enabled_in_text_threads = false;
      # features.edit_prediction_provider = "copilot"; # Renamed in Nightly
    };
  };
}
