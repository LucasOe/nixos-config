{ config, ... }:

{
  wayland.windowManager.niri.settings = {
    cursor = {
      xcursor-theme = config.stylix.cursor.name;
      xcursor-size = config.stylix.cursor.size;
    };

    layout = with config.lib.stylix.colors.withHashtag; {
      border = {
        active-color = base0B;
        urgent-color = base0F;
        inactive-color = base03;
      };

      focus-ring = {
        active-color = base0B;
        urgent-color = base0F;
        inactive-color = base03;
      };

      tab-indicator = {
        active-color = base0B;
        urgent-color = base0F;
        inactive-color = base02;
      };

      insert-hint.color = "${base07}80"; # 50% opacity
    };

    recent-windows.highlight = with config.lib.stylix.colors.withHashtag; {
      active-color = base02;
      urgent-color = base0F;
    };
  };
}
