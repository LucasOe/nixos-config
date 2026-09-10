{
  nixpkgs.overlays = [
    (final: prev: {
      refern = final.stdenv.mkDerivation (finalAttrs: {
        pname = "refern";
        version = "1.8.1";

        src = final.fetchurl {
          url = "https://storage.googleapis.com/refern-releases/releases/v${finalAttrs.version}/refern-${finalAttrs.version}-1.x86_64.rpm";
          hash = "sha256-M43SilIQTaexCW/Lhc+Lh0NII5Sarjh0SJElEQtOlZU=";
        };

        nativeBuildInputs = with final; [
          autoPatchelfHook
          rpmextract
          wrapGAppsHook3
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
            --prefix PATH : "${final.lib.makeBinPath [ final.desktop-file-utils ]}"
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
