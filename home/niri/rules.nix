{ ... }:

{
  programs.niri.settings = {
    layer-rules = [
      {
        matches = [ { namespace = "^quickshell$"; } ];
        place-within-backdrop = true;
      }
      {
        matches = [ { namespace = "^quickshell-wallpaper$"; } ];
        place-within-backdrop = true;
      }
      {
        matches = [ { namespace = "^quickshell-overview$"; } ];
        place-within-backdrop = true;
      }
    ];
  };
}
