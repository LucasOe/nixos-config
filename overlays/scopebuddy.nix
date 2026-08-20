{ inputs, ... }:

{
  # We add scopebuddy as an overlay instead of using the package, so that the
  # overlay for gamescope gets applied.
  #
  # We have to import it in a nixosModule, because using `nixpkgs.overlays` with
  # `home-manager.useGlobalPkgs = true` is not supported.
  nixpkgs.overlays = [ inputs.scopebuddy.overlays.default ];
}
