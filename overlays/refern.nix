{
  nixpkgs.overlays = [
    (final: prev: {
      refern = final.stdenv.mkDerivation (finalAttrs: {
        pname = "refern";
        version = "1.6.0";

        src = final.fetchurl {
          url = "https://storage.googleapis.com/refern-releases/releases/v${finalAttrs.version}/refern-${finalAttrs.version}-1.x86_64.rpm";
          hash = "sha256-mfi48WsHqP7jLPeaDK5E9SHajh4gf5pegwrdIFoWEkc=";
        };

        nativeBuildInputs = with final; [
          autoPatchelfHook
          rpmextract
          wrapGAppsHook4
        ];

        buildInputs = with final; [
          glib
          gtk3
          libayatana-appindicator
          libdrm
          libgbm
          libGL
          libheif
          libsoup_3
          wayland
          webkitgtk_4_1
        ];

        preFixup = ''
          gappsWrapperArgs+=(
            --prefix LD_LIBRARY_PATH : "${final.lib.makeLibraryPath [ final.libayatana-appindicator ]}"
          )
        '';

        unpackPhase = ''
          rpmextract "$src"
        '';

        installPhase = ''
          runHook preInstall

          mkdir -p "$out"
          mv usr/* "$out/"

          runHook postInstall
        '';

        meta = {
          description = "Visual reference manager";
          homepage = "https://refern.app";
          license = final.lib.licenses.unfree;
          platforms = [ "x86_64-linux" ];
          mainProgram = "refern";
        };
      });
    })
  ];
}
