{ ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      xwayland-satellite = prev.xwayland-satellite.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          # fix steam dropdowns closing instantly and unity add component not focusing
          # https://github.com/Supreeeme/xwayland-satellite/pull/494
          (final.fetchpatch2 {
            url = "https://github.com/Supreeeme/xwayland-satellite/compare/22cde7d2883a846f26fee8b7a26994f7e08e7a94.diff?full_index=1";
            hash = "sha256-E5AWhsCJreFtDSd+CFqLWZI2CqN9K2FXeI9Cus9x8xE=";
          })
        ];
      });
    })
  ];
}
