{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  # https://codeberg.org/BANanaD3V/niri-nix/src/branch/main/modules/nixos.nix
  imports = [ inputs.niri-nix.nixosModules.default ];

  # https://codeberg.org/BANanaD3V/niri-nix/src/branch/main/nixos-options.md
  programs.niri.enable = true;
  programs.niri.withUWSM = true;
  nixpkgs.overlays = [ inputs.niri-nix.overlays.niri-nix ];
  programs.niri.package = pkgs.niri-unstable;

  environment.systemPackages = with pkgs; [
    xwayland-satellite-unstable
  ];

  # Fix conflicting definition by forcing niri-nix config
  systemd.user.units."niri.service" = {
    overrideStrategy = lib.mkForce "asDropin";
    text = lib.mkForce ''
      [Service]
      X-StopIfChanged=false
      X-RestartIfChanged=false
    '';
  };
}
