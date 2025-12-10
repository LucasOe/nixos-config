{ ... }:

{
  # https://junegunn.github.io/fzf/
  # https://github.com/junegunn/fzf/blob/master/ADVANCED.md
  programs.fzf = {
    enable = true;

    # Disable when using television
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    defaultCommand = "fd --type f --follow";
    fileWidgetCommand = "fd --type f --follow"; # Ctrl+T
    changeDirWidgetCommand = "fd --type d --follow"; # Alt+C

    defaultOptions = [
      "--ansi"
      "--cycle"
      "--height=~100%"
      "--info=inline-right"
      "--layout=reverse"
      "--preview-window=border-rounded:noinfo"
      "--style=full:rounded"
    ];
    fileWidgetOptions = [
      "--select-1"
      "--exit-0"
      "--preview='bat --color=always --style=numbers --line-range=:250 {}'"
      "--list-label=' Preview: <Ctrl+P> '"
      "--list-label-pos=bottom"
      "--input-label=' Files '"
      "--bind='start:change-preview-window(hidden)'"
      "--bind='ctrl-p:toggle-preview'"
    ];
    historyWidgetOptions = [
      "--no-sort"
      "--exact"
    ];
    colors = {
      "fg" = "bright-white";
      "fg+" = "bright-white";
      "bg" = "black";
      "bg+" = "black";
      "hl" = "bright-magenta";
      "hl+" = "bright-magenta";
      "info" = "bright-black";
      "border" = "bright-black";
      "gutter" = "black";
      "prompt" = "green";
      "pointer" = "green";
      "marker" = "yellow";
      "spinner" = "blue";
      "header" = "white";
      "scrollbar" = "green";
      "list-label" = "bright-black";
    };
  };

  stylix.targets.fzf = {
    enable = false;
  };
}
