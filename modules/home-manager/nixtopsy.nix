{ inputs, pkgs, ... }:

{
  home.packages = [ inputs.nixtopsy.packages.${pkgs.stdenv.hostPlatform.system}.default ];
}
