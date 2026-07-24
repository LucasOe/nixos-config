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
          # Mesa (https://docs.mesa3d.org/envvars.html)
          MESA_SHADER_CACHE_MAX_SIZE = "10G";
          # Nvidia (https://us.download.nvidia.com/XFree86/Linux-x86_64/515.76/README/openglenvvariables.html)
          __GL_SHADER_DISK_CACHE = "1";
          __GL_SHADER_DISK_CACHE_SIZE = "10737418240"; # 10 GB
          __GL_SHADER_DISK_CACHE_SKIP_CLEANUP = "1"; # Allow unlimited shader cache (~/.cache/nvidia)
          # Proton GE (https://github.com/gloriouseggroll/proton-ge-custom)
          PROTON_ENABLE_WAYLAND = "1";
          PROTON_DLSS_UPGRADE = "1"; # Can be set to a specific version, e.g. 310.5
          # Proton Cachy OS (https://github.com/CachyOS/proton-cachyos)
          PROTON_DXVK_LOWLATENCY = "1";
          PROTON_VKD3D_LOWLATENCY = "1";
          PROTON_LOCAL_SHADER_CACHE = "1";
          # vkd3d-proton (https://github.com/HansKristian-Work/vkd3d-proton)
          VKD3D_CONFIG = "descriptor_heap";
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

    # Workaround for issue with capSysNice not working in gamescope
    # https://github.com/NixOS/nixpkgs/issues/351516
    services.ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
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
