{ config, ... }:

{
  programs.zed-editor = {
    # https://zed.dev/docs/visual-customization
    userSettings = with config.stylix; {
      # General -> Workspace Restoration
      session.restore_unsaved_buffers = false;
      restore_on_startup = "launchpad";
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
        calt = true;
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
        # JavaScript
        "**/node_modules"
        # Nix
        "**/.devenv"
        "**/.direnv"
        # Python
        "**/.venv"
        "**/__pycache__"
      ];
      # Window & Layout -> Title Bar
      title_bar = {
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
        default_width = 360;
        dock = "left";
        starts_open = false;
      };
      # Panels -> Outline Panel
      outline_panel = {
        default_width = 360;
        dock = "left";
      };
      # Panels -> Git Panel
      git_panel = {
        default_width = 360;
        dock = "left";
        tree_view = true;
      };
      # Panels -> Collaboration Panels
      collaboration_panel = {
        button = false;
      };
      # Terminal
      terminal = {
        blinking = "on";
        cursor_shape = "bar";
        font_features = {
          calt = true;
          zero = true;
        };
        line_height = "standard";
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
        dock = "right";
        sidebar_side = "right"; # Threads Panel
      };
      # AI -> Edit Predictions
      show_edit_predictions = false;
      edit_predictions = {
        provider = "copilot";
        mode = "subtle";
      };
    };
  };
}
