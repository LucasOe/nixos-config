{ username, ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/${username}/Projects/nixos-config";
  };
}
