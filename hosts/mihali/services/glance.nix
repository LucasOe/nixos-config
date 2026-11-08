{ ... }:

{
  services.glance = {
    enable = true;
    settings = {
      branding = {
        hide-footer = true;
      };
      theme = {
        disable-picker = true;
      };
      pages = [
        {
          name = "Home";
          columns = [
            {
              size = "full";
              widgets = [
                {
                  type = "monitor";
                  cache = "1m";
                  title = "Services";
                  sites = [
                    {
                      title = "Stump";
                      url = "https://stump.ts.lucasoe.com/";
                      icon = "sh:stump";
                    }
                  ];
                }
                {
                  type = "docker-containers";
                  # The glance service can't read /run/user/1000/docker.sock, so
                  # we use TCP remote-access instead.
                  sock-path = "tcp://127.0.0.1:2375";
                }
              ];
            }
            {
              size = "small";
              widgets = [
                {
                  type = "server-stats";
                  servers = [
                    {
                      type = "local";
                      hide-mountpoints-by-default = true;
                      mountpoints = {
                        "/" = {
                          name = "Root";
                          hide = false;
                        };
                      };
                    }
                  ];
                }
                {
                  type = "bookmarks";
                  groups = [
                    {
                      links = [
                        {
                          title = "Cloudflare";
                          url = "https://dash.cloudflare.com/";
                        }
                        {
                          title = "Tailscale";
                          url = "https://console.tailscale.com/";
                        }
                      ];
                    }
                  ];
                }
              ];
            }
          ];
        }
      ];
    };
  };
}
