{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri-nix.overlays.niri-nix

    (final: prev: {
      niri-unstable = prev.niri-unstable.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          # feat: force render (https://github.com/niri-wm/niri/pull/2609, mithicSpirit branch @ d98bc1d)
          (final.fetchpatch2 {
            url = "https://github.com/niri-wm/niri/compare/7f26c3ee804fb6ed458ef7fb0e3c794f14e0b3bc...d98bc1df96befa4ed60f3e6e419778b8544a3641.diff?full_index=1";
            hash = "sha256-rBtWDfcJM8QNv3tih+jDihL3B7k1IdX0VbcavBIJsgo=";
          })

          # window-rule: add is-fullscreen matcher (https://github.com/niri-wm/niri/pull/4064)
          (final.fetchpatch2 {
            url = "https://github.com/niri-wm/niri/compare/7f26c3ee804fb6ed458ef7fb0e3c794f14e0b3bc...9a72ee871ebc269f666962945e445470cdf3a7ef.diff?full_index=1";
            hash = "sha256-4yc0BcFZIUNVNzk4KiMOUslBiMByp1FbjOMrQJKoTMI=";
          })
        ];
      });
    })
  ];
}
