{ lib, pkgs, ... }:

{
  # Replace with module once this PR is merged:
  # https://github.com/NixOS/nixpkgs/pull/319535
  environment.systemPackages = with pkgs; [ nautilus ];

  # Fix Nautilus error "Your GStreamer installation is missing a plug-in."
  # https://github.com/NixOS/nixpkgs/issues/195936#issuecomment-1278954466
  # https://github.com/NixOS/nixpkgs/issues/53631#issuecomment-3704189416
  environment.sessionVariables = {
    GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" [
      pkgs.gst_all_1.gst-plugins-good
      pkgs.gst_all_1.gst-plugins-bad
      pkgs.gst_all_1.gst-plugins-ugly
      pkgs.gst_all_1.gst-libav
    ];
  };
}
