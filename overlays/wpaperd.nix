{
  nixpkgs.overlays = [
    (final: prev: {
      wpaperd = prev.wpaperd.overrideAttrs (_: rec {
        version = "1.2.3";

        src = final.fetchFromGitHub {
          owner = "danyspin97";
          repo = "wpaperd";
          rev = "8d9ae1edbdc648063a8cdade3a3a9fc38b45b139";
          hash = "sha256-WByb493PT3RcH9RH/VQTabjQUC1jgXO12ZXMSZgoS0M=";
        };

        cargoDeps = final.rustPlatform.fetchCargoVendor {
          inherit src;
          hash = "sha256-Vz5x9V+q5OwRR/GdiM/kEEfENSQ+KyN3DKM35NHuzAk=";
        };
      });
    })
  ];
}
