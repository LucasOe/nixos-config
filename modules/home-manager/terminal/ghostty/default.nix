{ ... }:

{
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 13;
      font-feature = "calt zero";
      cursor-style = "bar";
      cursor-click-to-move = true;
      window-padding-x = 10;
      window-padding-y = 10;
      confirm-close-surface = false;
      keybind = [
        # Remove defeault keybinds
        # Using Niri for tabs, no need for this in Ghostty.
        "clear"
        # Clipboard
        "copy=copy_to_clipboard"
        "paste=paste_from_clipboard"
        "ctrl+c=copy_to_clipboard"
        "ctrl+v=paste_from_clipboard"
        # Splits
        "ctrl+shift+t=new_split:auto"
        "ctrl+shift+w=close_surface"
        "ctrl+tab=goto_split:next"
        "ctrl+shift+tab=goto_split:previous"
        "ctrl+shift+arrow_up=resize_split:up,10"
        "ctrl+shift+arrow_down=resize_split:down,10"
        "ctrl+shift+arrow_left=resize_split:left,10"
        "ctrl+shift+arrow_right=resize_split:right,10"
        # Navigation
        "ctrl+shift+page_down=jump_to_prompt:1"
        "ctrl+shift+page_up=jump_to_prompt:-1"
        # General
        "ctrl+shift+a=select_all"
        "ctrl+shift+p=toggle_command_palette"
        "ctrl++=increase_font_size:1"
        "ctrl+-=decrease_font_size:1"
        # Scrolling
        "shift+end=scroll_to_bottom"
        "shift+home=scroll_to_top"
        "shift+page_down=scroll_page_down"
        "shift+page_up=scroll_page_up"
        "ctrl+l=clear_screen"
        # Selection
        # This does not create a new selection, and does nothing when there currently isn't one.
        "shift+arrow_down=adjust_selection:down"
        "shift+arrow_left=adjust_selection:left"
        "shift+arrow_right=adjust_selection:right"
        "shift+arrow_up=adjust_selection:up"
      ];
    };
  };

  stylix.targets.ghostty = {
    enable = true;
  };
}
