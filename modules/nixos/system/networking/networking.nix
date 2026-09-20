{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.networking;
in
{
  options.my.networking = {
    nextdns.id = lib.mkOption {
      default = null;
      description = "NextDNS ID";
      type = lib.types.nullOr lib.types.str;
    };
  };

  config = {
    environment.systemPackages = lib.mkIf config.my.gui.enable [
      pkgs.networkmanagerapplet
    ];

    networking = {
      networkmanager.enable = true;

      # Firewall
      firewall = {
        enable = true;
        checkReversePath = false;
        trustedInterfaces = [
          config.services.tailscale.interfaceName
        ];
        allowedTCPPorts = [
          3000 # Vite dev server
        ];
        allowedUDPPorts = [
          5353 # mDNS
        ];
      };

      # Enable NextDNS to be used with systemd-resolved
      nameservers = lib.mkIf (cfg.nextdns.id != null) [
        "45.90.28.0#${config.networking.hostName}-${cfg.nextdns.id}.dns.nextdns.io"
        "2a07:a8c0::#${config.networking.hostName}-${cfg.nextdns.id}.dns.nextdns.io"
        "45.90.30.0#${config.networking.hostName}-${cfg.nextdns.id}.dns.nextdns.io"
        "2a07:a8c1::#${config.networking.hostName}-${cfg.nextdns.id}.dns.nextdns.io"
      ];
    };

    # Enable the OpenSSH daemon
    services.openssh = {
      enable = true;
      openFirewall = true;
      settings = {
        PermitRootLogin = "no"; # disable root login
        KbdInteractiveAuthentication = false; # disable keyboard-interactive authentication
        PasswordAuthentication = false; # disable password login
      };
    };

    # Fall back to a known terminfo entry
    # https://ghostty.org/docs/help/terminfo#method-2:-configure-ssh-to-fall-back-to-a-known-terminfo-entry
    programs.ssh.extraConfig = ''
      Host *
        SetEnv TERM=xterm-256color
    '';

    # Enable systemd-resolved
    # Uses `config.networking.nameservers` for DNS
    services.resolved = {
      enable = true;

      settings.Resolve = {
        Domains = [ "~." ];
        MulticastDNS = "yes";
        DNSOverTLS = lib.mkIf (cfg.nextdns.id != null) "yes";
        FallbackDNS = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
    };

    # Prevent systemd from waiting for network online
    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;
  };
}
