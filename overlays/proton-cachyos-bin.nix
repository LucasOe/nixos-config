{
  nixpkgs.overlays = [
    (final: prev: {
      proton-cachyos-bin = final.stdenvNoCC.mkDerivation (finalAttrs: {
        pname = "proton-cachyos-bin";
        version = "10.0-20260408";

        src = final.fetchzip {
          url = "https://github.com/CachyOS/proton-cachyos/releases/download/cachyos-${finalAttrs.version}-slr/proton-cachyos-${finalAttrs.version}-slr-x86_64.tar.xz";
          hash = "sha256-JfhqGFmb0j8xRI/nzCl4HnSbjk8SiTsC9HuZjCV8zG0=";
        };

        dontUnpack = true;
        dontConfigure = true;
        dontBuild = true;

        outputs = [
          "out"
          "steamcompattool"
        ];

        installPhase = ''
          runHook preInstall

          # Make it impossible to add to an environment. You should use the appropriate NixOS option.
          # Also leave some breadcrumbs in the file.
          echo "${finalAttrs.pname} should not be installed into environments. Please use programs.steam.extraCompatPackages instead." > $out

          mkdir $steamcompattool
          ln -s $src/* $steamcompattool
          rm $steamcompattool/compatibilitytool.vdf
          cp $src/compatibilitytool.vdf $steamcompattool

          runHook postInstall
        '';

        # Can be overridden to alter the display name in steam
        # This could be useful if multiple versions should be installed together
        preFixup = ''
          substituteInPlace "$steamcompattool/compatibilitytool.vdf" \
            --replace-fail "proton-cachyos-${finalAttrs.version}-slr-x86_64" "Proton-CachyOS"
        '';

        meta = {
          description = "Compatibility tool for Steam Play based on Wine.";
          homepage = "https://github.com/CachyOS/proton-cachyos";
          license = final.lib.licenses.bsd3;
          platforms = [ "x86_64-linux" ];
          sourceProvenance = [ final.lib.sourceTypes.binaryNativeCode ];
        };
      });
    })
  ];
}
