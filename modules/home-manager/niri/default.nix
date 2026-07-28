{ ... }:

{
  wayland.windowManager.niri = {
    enable = true;

    # We set the portal in the NixOS module
    portalPackage = null;
  };
}
