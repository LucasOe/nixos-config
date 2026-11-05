{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri.overlays.default

    (final: prev: {
      niri = prev.niri.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          # feat: force render (v2)
          # https://github.com/niri-wm/niri/pull/4392
          ./patches/force-render.patch
          # (final.fetchpatch2 {
          #   url = "https://github.com/niri-wm/niri/compare/bf3d24c9302ba09ac01f0175a403a301bf00f17b.diff?full_index=1";
          #   hash = "sha256-om5Yh9dT7ZJ0sDeFI/YAcEtP55QuC8Vmey+eYpIorXY=";
          #   excludes = [ "docs/*" ];
          # })

          # window-rule: add is-fullscreen matcher
          # https://github.com/niri-wm/niri/pull/4064
          ./patches/is-fullscreen.patch
          # (final.fetchpatch2 {
          #   url = "https://github.com/niri-wm/niri/compare/c50f06b48d047d3cb7a4a07ec95242602394c81a.diff?full_index=1";
          #   hash = "sha256-4F4kkyfiNYMsOkJCliZ3Sac37bYPCEjgSwGSJgaXiKk=";
          #   excludes = [ "docs/*" ];
          # })
        ];
      });
    })
  ];
}
