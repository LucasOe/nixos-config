{ ... }:

{
  programs.fastfetch = {
    enable = true;
    # https://raw.githubusercontent.com/fastfetch-cli/fastfetch/dev/doc/json_schema.json
    settings = {
      logo = {
        type = "none";
      };
      display = {
        color.keys = "magenta";
      };
      modules = [
        {
          type = "title";
        }
        {
          type = "os";
          key = " OS";
          format = "{pretty-name}";
        }
        {
          type = "kernel";
          key = " Kernel";
        }
        {
          type = "host";
          key = "󰌢 Host";
          format = "{name}";
        }
        {
          type = "uptime";
          key = "󰅐 Uptime";
        }
        {
          type = "packages";
          key = " Packages";
        }
        {
          type = "shell";
          key = " Shell";
        }
        {
          type = "terminal";
          key = " Terminal";
        }
        {
          type = "wm";
          key = " WM";
        }
        {
          type = "lm";
          key = " LM";
        }
        {
          type = "cpu";
          key = "󰻠 CPU";
        }
        {
          type = "gpu";
          key = "󰍛 GPU";
        }
        {
          type = "disk";
          key = " Disk";
        }
        {
          type = "memory";
          key = "󰑭 Memory";
        }
        {
          type = "display";
          key = "󰍹 Display";
        }
      ];
    };
  };
}
