{ config, lib, ... }:

{
  wayland.windowManager.niri.settings = {
    cursor = {
      xcursor-theme = lib.mkDefault config.stylix.cursor.name;
      xcursor-size = lib.mkDefault config.stylix.cursor.size;
    };

    layout = with config.lib.stylix.colors.withHashtag; {
      border = {
        active-color = lib.mkDefault base0D;
        urgent-color = lib.mkDefault base08;
        inactive-color = lib.mkDefault base03;
      };

      focus-ring = {
        active-color = lib.mkDefault base0D;
        urgent-color = lib.mkDefault base08;
        inactive-color = lib.mkDefault base03;
      };

      tab-indicator = {
        active-color = lib.mkDefault base0B;
        urgent-color = lib.mkDefault base09;
        inactive-color = lib.mkDefault base04;
      };

      insert-hint.color = lib.mkDefault "${base07}80"; # 50% opacity
    };

    recent-windows.highlight = with config.lib.stylix.colors.withHashtag; {
      active-color = lib.mkDefault base02;
      urgent-color = lib.mkDefault base0F;
    };
  };
}
