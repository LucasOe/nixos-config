{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.caddy = {
    enable = true;
    openFirewall = true;
    environmentFile = config.age.secrets."cloudflare-caddy".path;

    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/caddy-dns/cloudflare@v0.2.4" ];
      hash = "sha256-QSiwKqKvSxhksWBF4/MlBOpyXba5xOQ2sRwA0R7399E=";
    };

    # https://caddyserver.com/docs/caddyfile/options
    globalConfig = ''
      acme_dns cloudflare {env.CF_API_TOKEN}
      tls_resolvers 1.1.1.1
    '';

    virtualHosts = {
      # Stump
      "stump.ts.lucasoe.com".extraConfig = ''
        reverse_proxy 127.0.0.1:${lib.toString config.services.stump.port}
      '';

      # Glance
      "home.ts.lucasoe.com".extraConfig = ''
        reverse_proxy 127.0.0.1:${lib.toString config.services.glance.settings.server.port}
      '';
    };
  };
}
