{
  description = "NixOS configuration";

  inputs = {
    # Official NixOS package source, using nixos's unstable branch by default
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-genres = {
      url = "github:LucasOe/spicetify-genres";
      flake = false;
    };

    spicetify-utilities = {
      url = "github:kyrie25/spicetify-utilities";
      flake = false;
    };

    maccel = {
      url = "github:Gnarus-G/maccel";
    };

    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      home-manager,
      ...
    }:
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
      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#hostname'
      nixosConfigurations = {
        olem = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            # Overlays
            (import ./overlays)

            # Host specific configuration
            ./hosts/olem/configuration.nix

            # Default modules
            ./modules/nixos

            # Additional Modules
            inputs.stylix.nixosModules.stylix # Stylix
            inputs.niri.nixosModules.niri # Niri

            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username} = import ./modules/home-manager;
            }
          ];
        };
        tamas = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [
            # Overlays
            (import ./overlays)

            # Host specific configuration
            ./hosts/tamas/configuration.nix

            # Default modules
            ./modules/nixos

            # Additional Modules
            inputs.stylix.nixosModules.stylix # Stylix
            inputs.niri.nixosModules.niri # Niri
            inputs.maccel.nixosModules.default # maccel

            # make home-manager as a module of nixos
            # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.users.${username} = import ./modules/home-manager;
            }
          ];
        };
      };
    };
}
