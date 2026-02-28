{ ... }:

{
  programs.noctalia-shell = {
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        # Official
        polkit-agent = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        screen-recorder = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        # Community
        mini-docker = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        network-manager-vpn = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        unicode-picker = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };

    pluginSettings = {
      screen-recorder = {
        hideInactive = true;
        iconColor = "none";
        directory = "";
        filenamePattern = "recording_yyyyMMdd_HHmmss";
        frameRate = "60";
        audioCodec = "opus";
        videoCodec = "h264";
        quality = "very_high";
        colorRange = "limited";
        showCursor = true;
        copyToClipboard = false;
        audioSource = "both"; # none, default_output, default_input, both
        videoSource = "portal"; # portal, screen
        resolution = "original";
      };
      network-manager-vpn = {
        displayMode = "onhover";
        connectedColor = "none";
        disconnectedColor = "error";
      };
    };
  };
}
