{ nixosConfig, ... }:

{
  programs.ghostty = {
    themes.nixos = with nixosConfig.theme.colors; {
      background = base00;
      foreground = base05;
      cursor-color = base05;
      selection-background = base02;
      selection-foreground = base05;

      palette = with nixosConfig.theme.colors.withHashtag; [
        "0=${base00}" # black
        "1=${base08}" # red
        "2=${base0B}" # green
        "3=${base0A}" # yellow
        "4=${base0D}" # blue
        "5=${base0E}" # magenta
        "6=${base0C}" # cyan
        "7=${base05}" # white
        "8=${base03}" # bright black
        "9=${base08}" # bright red
        "10=${base0B}" # bright green
        "11=${base0A}" # bright yellow
        "12=${base0D}" # bright blue
        "13=${base0E}" # bright magenta
        "14=${base0C}" # bright cyan
        "15=${base07}" # bright white
      ];
    };
  };
}
