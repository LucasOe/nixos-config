{ config, ... }:

{
  programs.noctalia-shell = with config.lib.stylix.colors; {
    # https://docs.noctalia.dev/getting-started/nixos/#theme-colors
    colors = {
      mError = "#${base08}";
      mOnError = "#${base00}";
      mOnPrimary = "#${base00}";
      mOnSecondary = "#${base00}";
      mOnSurface = "#${base07}";
      mOnSurfaceVariant = "#${base07}";
      mOnTertiary = "#${base00}";
      mOutline = "#${base02}";
      mPrimary = "#${base0B}";
      mSecondary = "#${base0A}";
      mShadow = "#${base00}";
      mSurface = "#${base00}";
      mSurfaceVariant = "#${base01}";
      mTertiary = "#${base0D}";
    };
  };
}
