{ ... }:

{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep 3";
    flake = "/etc/nixos/"; # TODO: Move flake to home dir
  };
}
