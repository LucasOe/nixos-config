{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-mirror
    jq
  ];

  # https://sodiboo.github.io/niri-flake/settings
  imports = [
    ./input.nix
    ./keybinds.nix
    ./outputs.nix
    ./rules.nix
    ./settings.nix
  ];
}
