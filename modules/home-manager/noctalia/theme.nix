{ nixosConfig, ... }:

let
  # https://docs.noctalia.dev/v5/theming/palette/
  palette = with nixosConfig.theme.colors.withHashtag; {
    mPrimary = base0D;
    mOnPrimary = base00;
    mSecondary = base0E;
    mOnSecondary = base00;
    mTertiary = base0B;
    mOnTertiary = base00;
    mError = base08;
    mOnError = base00;
    mSurface = base00;
    mOnSurface = base07;
    mSurfaceVariant = base01;
    mOnSurfaceVariant = base05;
    mOutline = base02;
    mShadow = base00;
    mHover = base0B;
    mOnHover = base00;
    terminal = {
      background = base00;
      foreground = base05;
      cursor = base05;
      cursorText = base00;
      selectionBg = base03;
      selectionFg = base05;
      normal = {
        black = base00;
        red = base08;
        green = base0B;
        yellow = base0A;
        blue = base0D;
        magenta = base0E;
        cyan = base0C;
        white = base05;
      };
      bright = {
        black = base03;
        red = base08;
        green = base0B;
        yellow = base0A;
        blue = base0D;
        magenta = base0E;
        cyan = base0C;
        white = base07;
      };
    };
  };
in
{
  programs.noctalia = {
    settings = {
      theme = {
        source = "custom";
        custom_palette = "nixos";
      };
    };

    customPalettes = {
      nixos = {
        dark = palette;
        light = palette;
      };
    };
  };
}
