{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.millennium.overlays.default ];

  # Enable Steam
  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];

    # Open ports in the firewall
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Enable Gamemode
  programs.gamemode.enable = true;

  # Enable Gamescope
  programs.gamescope = {
    enable = true;
    # https://github.com/ValveSoftware/gamescope/issues/1924
    package = pkgs.gamescope.overrideAttrs (_: {
      NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];
    });
  };

  # Autostart Steam
  environment.systemPackages = [
    (pkgs.makeAutostartItem rec {
      name = "steam";
      package = pkgs.makeDesktopItem {
        inherit name;
        desktopName = "Steam";
        exec = "steam -silent %U";
        icon = "steam";
      };
    })
  ];
}
