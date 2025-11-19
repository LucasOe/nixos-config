{ lib, ... }:

{
  # Use path relative to the root of the project
  relativeToRoot = lib.path.append ../.;

  # Scan for all directories and nix files.
  # Don't call outside of `default.nix`
  scanPaths =
    path:
    builtins.map (f: (path + "/${f}")) (
      builtins.attrNames (
        lib.attrsets.filterAttrs (
          path: _type:
          (_type == "directory") # include directories
          || (
            (path != "default.nix") # ignore default.nix
            && (lib.strings.hasSuffix ".nix" path) # include .nix files
          )
        ) (builtins.readDir path)
      )
    );
}
