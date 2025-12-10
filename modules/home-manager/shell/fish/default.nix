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
  };
}
