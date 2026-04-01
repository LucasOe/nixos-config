{ pkgs, inputs, ... }:

{
  nixpkgs.overlays = [ inputs.millennium.overlays.default ];

  # Enable Steam
  programs.steam = {
    enable = true;
    package = pkgs.millennium-steam.override {
      extraEnv = {
        MANGOHUD = "1";
        PULSE_LATENCY_MSEC = "60";
        # https://github.com/gloriouseggroll/proton-ge-custom
        PROTON_DLSS_UPGRADE = "1"; # Can be set to a specific version, e.g. 310.5
        PROTON_ENABLE_WAYLAND = "1";
        # https://github.com/CachyOS/proton-cachyos
        PROTON_USE_NTSYNC = "1";
        PROTON_VKD3D_HEAP = "1";
      };
    };

    extraCompatPackages = with pkgs; [
      proton-ge-bin
      proton-cachyos-bin
    ];

    # Open ports in the firewall
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Enable ntsync
  boot.kernelModules = [ "ntsync" ];

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
