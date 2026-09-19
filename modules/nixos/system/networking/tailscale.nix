{ config, lib, ... }:

{
  services.tailscale = {
    enable = true;
    openFirewall = true;

    # Allow the Caddy user (and service) to edit certs
    permitCertUid = lib.mkIf config.services.caddy.enable "caddy";
  };

  # Force tailscaled to use nftables (Critical for clean nftables-only systems)
  # This avoids the "iptables-compat" translation layer issues.
  systemd.services.tailscaled.serviceConfig.Environment = [
    "TS_DEBUG_FIREWALL_MODE=nftables"
  ];
}
