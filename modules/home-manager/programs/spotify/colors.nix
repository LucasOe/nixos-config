{ config, ... }:

{
  programs.spicetify = {
    colorScheme = "custom";
    customColorScheme = with config.lib.stylix.colors; {
      text = base06;
      subtext = base05;
      main = base01;
      main-elevated = base02;
      highlight = base04;
      highlight-elevated = base05;
      sidebar = base00;
      player = base00;
      card = base00;
      shadow = base00;
      selected-row = base04;
      button = base0B;
      button-active = base0B;
      button-disabled = base02;
      tab-active = base02;
      notification = base0B;
      notification-error = base08;
      equalizer = base0B;
      misc = base02;
    };
  };
}
