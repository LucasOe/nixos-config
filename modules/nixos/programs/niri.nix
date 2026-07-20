{
  config,
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

  # NVIDIA VRAM leak workaround
  # https://niri-wm.github.io/niri/Nvidia.html
  environment.etc."nvidia/nvidia-application-profiles-rc.d/50-limit-free-buffer-pool-in-wayland-compositors.json".text =
    lib.mkIf config.hardware.nvidia.enabled (
      builtins.toJSON {
        rules = [
          {
            pattern = {
              feature = "procname";
              matches = "niri";
            };
            profile = "Limit Free Buffer Pool On Wayland Compositors";
          }
        ];
        profiles = [
          {
            name = "Limit Free Buffer Pool On Wayland Compositors";
            settings = [
              {
                key = "GLVidHeapReuseRatio";
                value = 0;
              }
            ];
          }
        ];
      }
    );
}
