{ ... }:

{
  nixpkgs.overlays = [
    # Skipping tests while upstream sorts it out, revert once
    # Hydra consistently builds openldap green.
    # https://github.com/NixOS/nixpkgs/issues/513245
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (_: {
        doCheck = !prev.stdenv.hostPlatform.isi686;
      });
    })
  ];
}
