{
  nixpkgs.overlays = [
    (final: prev: {
      libratbag = prev.libratbag.overrideAttrs (_: {
        version = "unstable-2026-08-18";

        src = final.fetchFromGitHub {
          owner = "libratbag";
          repo = "libratbag";
          rev = "b8d4d3ca1f4d6b23c664ffee2888b8eb669bee21";
          hash = "sha256-8V/LIki/tI/9Wi6kuFJp6k1p+moMh8Gc8RNP1BUlZO8=";
        };
      });

      piper = prev.piper.overrideAttrs (_: {
        version = "unstable-2026-08-12";

        src = final.fetchFromGitHub {
          owner = "libratbag";
          repo = "piper";
          rev = "5d3c8845b55643595ccb8029dfa5c7a2fb079e77";
          hash = "sha256-oGa0NXgoiVYadCAB5cnQYrjh3KIVWhTxsSYaB4TVZSA=";
        };
      });
    })
  ];
}
