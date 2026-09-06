{ ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      niri = prev.niri.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          # feat: force render (v2)
          # https://github.com/niri-wm/niri/pull/4392
          (final.fetchpatch2 {
            url = "https://github.com/niri-wm/niri/compare/1352ddeefa7a2687d5f7babd346abe878625c3a1.diff?full_index=1";
            hash = "sha256-Tih+zFUiUbtYu5hXhql8TlW5Jkmo78ZNKi8rC/YejnI=";
          })

          # window-rule: add is-fullscreen matcher
          # https://github.com/niri-wm/niri/pull/4064
          (final.fetchpatch2 {
            url = "https://github.com/niri-wm/niri/compare/c50f06b48d047d3cb7a4a07ec95242602394c81a.diff?full_index=1";
            hash = "sha256-3cLJEool4uysX5h1UgH4VmbBJdMOOUrrtJl+GaBX0OQ=";
          })
        ];
      });
    })
  ];
}
