{ config, ... }:

{
  programs.fish = {
    enable = true;
    generateCompletions = false; # Completions don't work when set to true for some reason
    interactiveShellInit = with config.lib.stylix.colors; ''
      set fish_greeting # Disable greeting

      # Colors
      # https://fishshell.com/docs/current/interactive.html#syntax-highlighting-variables
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
    '';
    shellAliases = {
      cat = "bat";
      grep = "rg";
      find = "fd";
      ls = "eza";
      ll = "eza -l";
      la = "eza -la";
      lt = "eza --tree";
    };
  };
}
