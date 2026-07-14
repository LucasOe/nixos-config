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

This flake uses [import-tree](https://github.com/denful/import-tree) to recursively import all modules, overlays and hosts.
Most modules are enabled by default for all hosts. Optional modules use [Option Declarations](https://nixos.org/manual/nixos/stable/index.html#sec-option-declarations) for per-host configuration.

## Imperative Setup

While most of the system configuration is declarative, some state is intentionally managed outside of Nix and must be configured manually after installation.

- **User Passwords**: Set a password for your user account with `passwd <username>`.
- **Network Connections**: Configure Wi-Fi and import VPN profiles using NetworkManager (`nmcli` or a graphical frontend).
- **GitHub Access Token**: Optionally add a GitHub API token to `~/.config/nix/nix.conf` to avoid rate limiting.
- **Bluetooth Devices**: Pair Bluetooth devices using `bluetoothctl`.
