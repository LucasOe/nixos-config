{
  description = "NixOS configuration";

  # Run 'nix flake check' to add substituters to ~/.local/share/nix/trusted-settings.json
  # nh doesn't prompt for accepting the flake config (https://github.com/nix-community/nh/issues/324)
  nixConfig = {
    extra-substituters = [
      "https://cache.nixos.org"
      "https://cache.nixos-cuda.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.zst";

    import-tree = {
      url = "github:denful/import-tree";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    base16 = {
      url = "github:SenchoPens/base16.nix";
    };

    nix-colorizer = {
      url = "github:nutsalhan87/nix-colorizer";
    };

    firefox-gnome-theme = {
      # Switch back to rafaelmardojai/firefox-gnome-theme once this PR is merged:
      # https://github.com/rafaelmardojai/firefox-gnome-theme/pull/1108
      url = "github:DavideLoconte/firefox-gnome-theme";
      flake = false;
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    maccel = {
      url = "github:Gnarus-G/maccel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium = {
      url = "github:SteamClientHomebrew/Millennium/?dir=packages/nix";
    };

    scopebuddy = {
      url = "github:OpenGamingCollective/ScopeBuddy";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xwayland-satellite = {
      url = "github:Supreeeme/xwayland-satellite";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      configLib = import ./lib { inherit (nixpkgs) lib; };
      username = "lucas";

      specialArgs = {
        inherit inputs;
        inherit configLib;
        inherit username;
      };
    in
    {
      nixosConfigurations = {
        olem = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            (inputs.import-tree ./overlays)
            (inputs.import-tree ./modules/nixos)
            (inputs.import-tree ./hosts/olem)
          ];
        };

        tamas = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            (inputs.import-tree ./overlays)
            (inputs.import-tree ./modules/nixos)
            (inputs.import-tree ./hosts/tamas)
          ];
        };
      };
    };
}
