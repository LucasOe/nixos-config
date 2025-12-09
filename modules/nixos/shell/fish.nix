{ pkgs, ... }:

{
  programs.fish.enable = true;
  environment.shells = with pkgs; [ fish ];
  environment.pathsToLink = [ "/share/fish" ];
  users.defaultUserShell = pkgs.fish;
}
