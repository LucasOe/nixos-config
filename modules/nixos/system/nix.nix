{ pkgs, ... }:

{
  # Required for Flakes
  environment.systemPackages = [ pkgs.git ];

  nix = {
    # Disable Channels, we're using Flakes instead
    channel.enable = false;

    # https://nixos.org/manual/nix/stable/command-ref/conf-file
    # Show current config: `nix config show`
    settings = {
      use-xdg-base-directories = true;
      warn-dirty = false;

      # Enable Flakes
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Add substituters
      extra-substituters = [
        "https://nix-community.cachix.org"
        "https://niri-nix.cachix.org"
        "https://noctalia.cachix.org"
      ];
      extra-trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];

      # Add sudo users as trusted, so nixos-rebuild works
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };
}
