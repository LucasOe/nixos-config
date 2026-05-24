{ inputs, pkgs, ... }:

{
  # Can be removed once https://github.com/NixOS/nixpkgs/pull/442948 is merged
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  # Enable niri
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/programs/wayland/niri.nix
  programs.niri.enable = true;
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.package = pkgs.niri-unstable;
}
