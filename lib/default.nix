{ lib, ... }:

{
  # use path relative to the root of the project
  relativeToRoot = lib.path.append ../.;

  # Scan for all directories and nix files.
  # Don't call outside of `default.nix`
  scanPaths =
    path:
    builtins.map (f: (path + "/${f}")) (
      builtins.attrNames (
        lib.attrsets.filterAttrs (
          path: _type:
          # include directories
          (_type == "directory")
          # include .nix files but ignore default.nix
          || ((path != "default.nix") && (lib.strings.hasSuffix ".nix" path))
        ) (builtins.readDir path)
      )
    );
}
