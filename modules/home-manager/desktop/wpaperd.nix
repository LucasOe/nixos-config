{ config, ... }:

{
  services.wpaperd = {
    enable = true;

    # https://github.com/danyspin97/wpaperd#wallpaper-configuration
    settings = {
      any = {
        path = config.stylix.image;
        mode = "fit-border-color";
      };
    };
  };
}
