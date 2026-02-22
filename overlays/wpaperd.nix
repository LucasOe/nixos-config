{
  nixpkgs.overlays = [
    (final: prev: {
      wpaperd = prev.wpaperd.overrideAttrs (_: rec {
        version = "1.2.3";

        src = final.fetchFromGitHub {
          owner = "danyspin97";
          repo = "wpaperd";
          rev = "8d9ae1edbdc648063a8cdade3a3a9fc38b45b139";
          hash = "sha256-ZjI/LrbweEFwVVrzEQ6JqUO9CaWkd2WINte6pJu4t+U=";
        };

        cargoDeps = final.rustPlatform.fetchCargoVendor {
          inherit src;
          hash = "sha256-Vz5x9V+q5OwRR/GdiM/kEEfENSQ+KyN3DKM35NHuzAk=";
        };
      });
    })
  ];
}
