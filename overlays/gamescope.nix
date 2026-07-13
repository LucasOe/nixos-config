{
  nixpkgs.overlays = [
    (final: prev: {
      # https://github.com/ValveSoftware/gamescope/issues/1924
      gamescope = prev.gamescope.overrideAttrs (_: {
        NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];
      });
    })
  ];
}
