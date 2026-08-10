{ ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      networkmanagerapplet = prev.networkmanagerapplet.overrideAttrs (old: {
        postPatch = old.postPatch + ''
          # Don't run post install script that enables XDG autostart
          sed -i meson.build \
            -e '/meson.add_install_script/,+4 d'
        '';
      });
    })
  ];
}
