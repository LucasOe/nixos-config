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
      trusted-users = [
        "root"
        "@wheel"
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };
}
