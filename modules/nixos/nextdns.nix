{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nextdns
  ];

  # Note: Also set "network.trr.uri" in Firefox to set the NextDNS provider
  services.nextdns = {
    enable = true;

    # https://github.com/nextdns/nextdns/wiki/Configuration
    arguments = [
      "-profile"
      "fcc66c"
      "-cache-size"
      "10MB"
      "-report-client-info"
    ];
  };

  systemd.services.nextdns-activate = {
    script = "/run/current-system/sw/bin/nextdns activate";
    after = [ "nextdns.service" ];
    wantedBy = [ "multi-user.target" ];
  };
}
