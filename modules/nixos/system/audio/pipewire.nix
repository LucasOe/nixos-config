{ ... }:

{
  # Enable sound with PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;

    # WirePlumber configuration documentation:
    # https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/settings.html
    wireplumber.extraConfig = {
      # Disable state restoration
      "50-wireplumber-settings" = {
        "wireplumber.settings" = {
          "device.restore-profile" = false;
          "device.restore-routes" = false;
          "node.stream.restore-props" = false;
          "node.stream.restore-target" = false;
        };
      };
    };
  };
}
