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
