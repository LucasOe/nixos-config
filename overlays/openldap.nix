{ ... }:

{
  nixpkgs.overlays = [
    # Skipping tests while upstream sorts it out, revert once
    # Hydra consistently builds openldap green.
    # https://github.com/NixOS/nixpkgs/issues/514113
    # Remove once https://github.com/NixOS/nixpkgs/pull/515956 is in unstable
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (_: {
        doCheck = !prev.stdenv.hostPlatform.isi686;
      });
    })
  ];
}
