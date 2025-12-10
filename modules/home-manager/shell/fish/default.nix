{ ... }:

{
  imports = [
    ./colors.nix
  ];

  programs.fish = {
    enable = true;
    generateCompletions = false; # Completions don't work when set to true for some reason
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    binds = {
      # Binds are removed from the shell completions by nixpkgs and have to be set manually
      # https://github.com/alexpasmantier/television/blob/main/television/utils/shell/completion.fish#L140
      # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/by-name/te/television/package.nix#L50
      # "ctrl-t".command = "tv_smart_autocomplete";
      # "ctrl-r".command = "tv_shell_history";
    };
  };
}
