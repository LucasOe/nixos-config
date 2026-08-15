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
    environment.systemPackages = with pkgs; [
      networkmanagerapplet
    ];

    networking = {
      networkmanager.enable = true;

      # Firewall
      firewall = {
        enable = true;
        checkReversePath = false;
        allowedTCPPorts = [
          22 # SSH
          3000 # Vite dev server
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

    # Enable systemd-resolved
    # Uses `config.networking.nameservers` for DNS
    services.resolved = {
      enable = true;

      settings.Resolve = lib.mkIf (cfg.nextdns.id != null) {
        Domains = [ "~." ];
        DNSOverTLS = "true";
        FallbackDNS = [
          "1.1.1.1"
          "1.0.0.1"
        ];
      };
    };
  };
}
