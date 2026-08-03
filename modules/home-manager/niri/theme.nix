{ nixosConfig, ... }:

{
  wayland.windowManager.niri.settings = {
    cursor = {
      xcursor-theme = nixosConfig.theme.cursor.name;
      xcursor-size = nixosConfig.theme.cursor.size;
    };

    layout = with nixosConfig.theme.colors.withHashtag; {
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

    recent-windows.highlight = with nixosConfig.theme.colors.withHashtag; {
      active-color = base02;
      urgent-color = base0F;
    };
  };
}
