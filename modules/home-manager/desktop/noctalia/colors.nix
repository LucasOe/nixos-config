{ config, lib, ... }:

{
  programs.noctalia-shell = with config.lib.stylix.colors.withHashtag; {
    # https://docs.noctalia.dev/getting-started/nixos/#theme-colors
    colors = lib.mkForce {
      mPrimary = base0B;
      mOnPrimary = base00;
      mSecondary = base0D;
      mOnSecondary = base00;
      mTertiary = base09;
      mOnTertiary = base00;
      mError = base0F;
      mOnError = base00;
      mSurface = base00;
      mOnSurface = base05;
      mSurfaceVariant = base01;
      mOnSurfaceVariant = base05;
      mOutline = base02;
      mShadow = base00;
      mHover = base05;
      mOnHover = base00;
    };
  };
}
