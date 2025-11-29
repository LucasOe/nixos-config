# NixOS System Configurations

My personal NixOS configuration, packaged as a flake for reproducible system and user (home-manager) configuration across machines.

## Directory Structure
```txt
.
├── hosts              # Per-host NixOS configurations
├── lib                # Utility functions
└── modules            # Reusable modules
    ├── home-manager   # Home-manager modules
    └── nixos          # Platform/system-level modules
```

## Commands

- Apply a host configuration: `sudo nixos-rebuild switch --flake .#hostname`
- Update flake inputs: `nix flake update`
