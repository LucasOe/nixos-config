{
  nixpkgs.overlays = [
    (final: prev: {
      obs-studio = prev.obs-studio.override {
        # Drop the CEF/Chromium browser source (~2 GB)
        browserSupport = false;
      };
    })
  ];
}
