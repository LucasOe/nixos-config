{
  nixpkgs.overlays = [
    (final: prev: {
      libratbag = prev.libratbag.overrideAttrs (_: {
        version = "unstable-2026-11-22";

        src = final.fetchFromGitHub {
          owner = "libratbag";
          repo = "libratbag";
          rev = "1aec93b2f81036014063fb8a9ac194a1c71bdec8";
          hash = "sha256-DzDe8ErX5ylWB2WEorrG1Q9jELQYQX+3K8Z10AfJGiU=";
        };

        # The patch from nixpkgs is already part of the upstream version
        patches = [ ];
      });

      piper = prev.piper.overrideAttrs (_: {
        version = "unstable-2026-11-22";

        src = final.fetchFromGitHub {
          owner = "libratbag";
          repo = "piper";
          rev = "341be18240b2af3b99189902e6850ffe358b811c";
          hash = "sha256-R5qMdv+Mwxe/OHI0YMN3HtvrZDKM1WAlYzIkUQ28HP8=";
        };
      });
    })
  ];
}
