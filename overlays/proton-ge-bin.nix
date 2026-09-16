{
  nixpkgs.overlays = [
    (final: prev: {
      proton-ge-bin = prev.proton-ge-bin.overrideAttrs (_: rec {
        version = "GE-Proton11-7";

        src = final.fetchzip {
          url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${version}/${version}-x86_64.tar.gz";
          hash = "sha256-ftW0vE45v2JsbaYqo/So0ZFfvdtakHX0XEXEE4TdxLk=";
        };
      });
    })
  ];
}
