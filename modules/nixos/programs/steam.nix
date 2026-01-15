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

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

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
