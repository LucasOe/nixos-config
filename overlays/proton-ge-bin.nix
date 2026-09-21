{
  nixpkgs.overlays = [
    (final: prev: {
      proton-ge-bin = prev.proton-ge-bin.overrideAttrs (
        finalAttrs:
        let
          version = "GE-Proton11-7";

          variants = {
            "x86_64-linux" = {
              toolName = "${version}-x86_64";
              src = final.fetchzip {
                url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${version}/${version}-x86_64.tar.gz";
                hash = "sha256-ftW0vE45v2JsbaYqo/So0ZFfvdtakHX0XEXEE4TdxLk=";
              };
            };
            "aarch64-linux" = {
              toolName = "${version}-aarch64";
              src = final.fetchzip {
                url = "https://github.com/GloriousEggroll/proton-ge-custom/releases/download/${version}/${version}-aarch64.tar.gz";
                hash = "sha256-tyI95zCUQklRVA9YtarD+gBQouMVcJmv7BafNx5CQu8=";
              };
            };
          };
        in
        {
          inherit version;
          inherit (variants.${final.stdenvNoCC.hostPlatform.system}) src toolName;
        }
      );
    })
  ];
}
