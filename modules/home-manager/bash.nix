{ ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ "erasedups" ];
    initExtra = ''
      # Binds are removed from the shell completions by nixpkgs and have to be set manually
      # https://github.com/alexpasmantier/television/blob/main/television/utils/shell/completion.bash#L134
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/te/television/package.nix#L46
      # bind -x '"\C-t":tv_smart_autocomplete'
      # bind -x '"\C-r":tv_shell_history'
    '';
  };
}
