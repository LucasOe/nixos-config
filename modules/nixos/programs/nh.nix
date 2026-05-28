{ username, ... }:

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--no-gcroots --keep 3";
    flake = "/home/${username}/Projects/nixos-config";
  };
}
