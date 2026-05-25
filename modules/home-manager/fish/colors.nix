{ config, ... }:

{
  # https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables
  programs.fish.interactiveShellInit = with config.lib.stylix.colors; ''
    set fish_color_normal white
    set fish_color_command green
    set fish_color_keyword magenta
    set fish_color_quote green
    set fish_color_redirection white
    set fish_color_end cyan
    set fish_color_error red
    set fish_color_param white
    set fish_color_valid_path white --underline
    set fish_color_option white
    set fish_color_comment ${base02}
    set fish_color_selection white --background=${base02}
    set fish_color_operator cyan
    set fish_color_escape cyan
    set fish_color_autosuggestion ${base03}
    set fish_color_status red
    set fish_color_cancel white
    set fish_color_search_match blue --background=${base02}
    set fish_color_history_current white --bold
    # Pager Colors
    set fish_pager_color_progress brblack
    set fish_pager_color_background --background=black
    set fish_pager_color_prefix red
    set fish_pager_color_completion white
    set fish_pager_color_description yellow
    set fish_pager_color_selected_background --background=brblack
    set fish_pager_color_selected_prefix red --bold
    set fish_pager_color_selected_completion brwhite --bold
    set fish_pager_color_selected_description yellow --bold
    set fish_pager_color_secondary_background --background=black
    set fish_pager_color_secondary_prefix red
    set fish_pager_color_secondary_completion white
    set fish_pager_color_secondary_description yellow
  '';
}
