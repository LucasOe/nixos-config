{ pkgs, ... }:

{
  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nixd
    devenv
  ];
}
