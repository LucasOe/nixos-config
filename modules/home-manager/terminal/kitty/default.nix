{ ... }:

{
  programs.kitty = {
    enable = true;
    # https://sw.kovidgoyal.net/kitty/conf
    settings = {
      clear_all_mouse_actions = true;
      clear_all_shortcuts = true;
      cursor_shape = "beam";
      cursor_shape_unfocused = "beam";
      enable_audio_bell = false;
      enabled_layouts = "vertical, horizontal";
      window_padding_width = 10;
    };
    mouseBindings = {
      "left click" = "ungrabbed mouse_handle_click selection link prompt";
      # URL handling
      "ctrl+left release" = "grabbed,ungrabbed mouse_handle_click link";
      "ctrl+left press " = "grabbed discard_event";
      # Selection
      "left press" = "ungrabbed mouse_selection normal";
      "left doublepress" = "ungrabbed mouse_selection word";
      "left triplepress" = "ungrabbed mouse_selection line";
    };
    keybindings = {
      # Clipboard
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+v" = "paste_from_clipboard";
      # Scrolling
      "ctrl+shift+up" = "scroll_line_up";
      "ctrl+shift+down" = "scroll_line_down";
      "ctrl+shift+page_up" = "scroll_page_up";
      "ctrl+shift+page_down" = "scroll_page_down";
      "ctrl+shift+home" = "scroll_home";
      "ctrl+shift+end" = "scroll_end";
      # Window management
      "ctrl+shift+t" = "new_window";
      "ctrl+shift+w" = "close_window";
      "ctrl+tab" = "next_window";
      # Layout management
      "ctrl+shift+l" = "next_layout";
    };
  };

  stylix.targets.kitty = {
    enable = true;
  };
}
