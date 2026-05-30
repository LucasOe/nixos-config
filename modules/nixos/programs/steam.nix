{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.steam;
  steamPkg = if cfg.millennium then pkgs.millennium-steam else pkgs.steam;
in
{
  options.my.steam = {
    enable = lib.mkEnableOption "Steam";

    millennium = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Millennium";
    };
    gamescope = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Gamescope";
    };
    autoStart = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Autostart Steam";
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays = [ inputs.millennium.overlays.default ];

    programs.steam = {
      enable = true;
      package = steamPkg.override {
        extraEnv = {
          MANGOHUD = "1";
          PULSE_LATENCY_MSEC = "60";
          # https://github.com/gloriouseggroll/proton-ge-custom
          PROTON_ENABLE_WAYLAND = "1";
          PROTON_DLSS_UPGRADE = lib.optionalAttrs config.my.nvidia.enable "1"; # Can be set to a specific version, e.g. 310.5
          # https://github.com/CachyOS/proton-cachyos
          PROTON_USE_NTSYNC = "1";
          # https://github.com/HansKristian-Work/vkd3d-proton
          VKD3D_CONFIG = "descriptor_heap";
          # https://github.com/jp7677/dxvk-nvapi
          DXVK_NVAPI_VKREFLEX = lib.optionalAttrs config.my.nvidia.enable "1"; # Might cause problems for games not using Reflex
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
      enable = cfg.gamescope;
      # https://github.com/ValveSoftware/gamescope/issues/1924
      package = pkgs.gamescope.overrideAttrs (_: {
        NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];
      });
    };

    # Autostart Steam
    environment.systemPackages = [
      (lib.mkIf cfg.autoStart (
        pkgs.makeAutostartItem rec {
          name = "steam";
          package = pkgs.makeDesktopItem {
            inherit name;
            desktopName = "Steam";
            exec = "steam -silent %U";
            icon = "steam";
          };
        }
      ))
    ];
  };
}
