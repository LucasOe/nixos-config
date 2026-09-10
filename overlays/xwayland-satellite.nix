{ inputs, ... }:

{
  nixpkgs.overlays = [ inputs.xwayland-satellite.overlays.default ];
}
