# NixOS System Configurations

My personal NixOS configuration, packaged as a flake for reproducible system and user (home-manager) configuration across machines.

## Flake Structure
```txt
.
├── assets             # Assets
├── hosts              # Per-host NixOS configurations
├── lib                # Utility functions
├── modules            # Reusable modules
│   ├── home-manager   # Home Manager configurations
│   └── nixos          # NixOS configurations
└── overlays           # Package Overlays
```

This flake uses [import-tree](https://github.com/denful/import-tree) to recoursively import all modules, overlays and hosts.
Most modules are enabled by default for all hosts. Optional modules use [Option Declarations](https://nixos.org/manual/nixos/stable/index.html#sec-option-declarations) for per-host configuration.
