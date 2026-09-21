# NixOS System Configurations

My personal NixOS configuration, packaged as a flake for reproducible system and
user (home-manager) configuration across machines.

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

This flake uses [import-tree](https://github.com/denful/import-tree) to
recursively import all modules, overlays and hosts. I do not use optional
imports; every file in `modules/` gets evalutated for every host. Optional
modules use [Option Declarations][options] for per-host configuration.

[options]: https://nixos.org/manual/nixos/stable/index.html#sec-option-declarations

## Hosts

| Hostname | Architecture | Hardware                            | Purpose           |
| -------- | ------------ | ----------------------------------- | ----------------- |
| mihali   | aarch64      | Raspberry Pi 4                      | Homelab           |
| olem     | x86_64       | Microsoft Surface Laptop 3          | University        |
| tamas    | x86_64       | AMD Ryzen 5 5600x + Nvidia GTX 3070 | Workstation       |

## Imperative Setup

While most of the system configuration is declarative, some state is
intentionally managed outside of Nix and must be configured manually after
installation.

- **User Passwords**: Set a password for your user account with `passwd <username>`.
- **SSH Keys**: Add your SSH key to `~/.ssh/`.
- **GitHub Access Token**: Add a GitHub API token to `~/.config/nix/nix.conf` to avoid rate limiting.

I am not using any secret management yet.
