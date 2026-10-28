{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.niri.overlays.default

    (final: prev: {
      niri = prev.niri.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          # feat: force render (v2)
          # https://github.com/niri-wm/niri/pull/4392
          (final.fetchpatch2 {
            url = "https://github.com/niri-wm/niri/compare/bf3d24c9302ba09ac01f0175a403a301bf00f17b.diff?full_index=1";
            hash = "sha256-om5Yh9dT7ZJ0sDeFI/YAcEtP55QuC8Vmey+eYpIorXY=";
            excludes = [ "docs/*" ];
          })

          # window-rule: add is-fullscreen matcher
          # https://github.com/niri-wm/niri/pull/4064
          (final.fetchpatch2 {
            url = "https://github.com/niri-wm/niri/compare/c50f06b48d047d3cb7a4a07ec95242602394c81a.diff?full_index=1";
            hash = "sha256-4F4kkyfiNYMsOkJCliZ3Sac37bYPCEjgSwGSJgaXiKk=";
            excludes = [ "docs/*" ];
          })

          # handlers: implement ext-image-copy for toplevel
          # https://github.com/niri-wm/niri/pull/4599
          (final.fetchpatch2 {
            url = "https://github.com/niri-wm/niri/compare/005f250532094567524ee137a5be5133690a0ecd.diff?full_index=1";
            hash = "sha256-Fm3lxNsGG7H9Wz+s0o4AfjQCH5xyqZ7EBFw8LDLwjYU=";
            excludes = [ "docs/*" ];
          })
        ];
      });
    })
  ];
}
