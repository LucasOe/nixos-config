{ inputs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      # fvs2: init at 0.1.5; bottles-unwrapped: add fvs2
      # https://github.com/NixOS/nixpkgs/pull/511730
      fvs2 = inputs.nixpkgs-bottles-pr.legacyPackages.${prev.system}.fvs2;
      bottles-unwrapped = inputs.nixpkgs-bottles-pr.legacyPackages.${prev.system}.bottles-unwrapped;
    })
  ];
}
