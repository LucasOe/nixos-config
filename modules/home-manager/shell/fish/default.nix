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
      fetch = "fastfetch";
      find = "fd";
      grep = "rg";
      la = "eza -la";
      ll = "eza -l";
      ls = "eza";
      lt = "eza --tree";
    };
  };
}
