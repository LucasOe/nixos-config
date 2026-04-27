{ ... }:

{
  services.pipewire = {
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
