{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [ inputs.nix-index-database.homeModules.default ];

  config = {
    programs.nix-index = {
      enable = true;
      package = inputs.nix-index-database.packages.${system}.nix-index-with-small-db;
    };

    programs.nix-index-database = {
      comma.enable = true;
    };
  };
}
