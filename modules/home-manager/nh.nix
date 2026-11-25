{ pkgs, username, ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/Projects/nixos-config";
  };

  # Required for remote diffing
  # See: https://github.com/nix-community/nh/blob/master/docs/remote-build.md#diffing-remote-systems
  home.packages = [ pkgs.dix ];
}
