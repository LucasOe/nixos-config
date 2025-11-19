{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # Icons
    material-design-icons

    # Programming Fonts
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];
}
