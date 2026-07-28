{ ... }:

{
  wayland.windowManager.niri = {
    enable = true;

    # Already set by the NixOS module
    portalPackage = null;
    systemd.enable = false;
  };
}
