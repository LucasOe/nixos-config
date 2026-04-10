{ ... }:

{
  # ALSA UCM configuration for the MOTU M4:
  # https://github.com/alsa-project/alsa-ucm-conf/blob/bf185325e9e6d86a5a8f8afac2d216ef575d355d/ucm2/USB-Audio/MOTU/M4-HiFi.conf
  # NixOS Wiki:
  # https://wiki.nixos.org/wiki/PipeWire
  services.pipewire = {
    # WirePlumber configuration documentation:
    # https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration.html
    wireplumber.extraConfig = {
      "10-motu-pro-audio" = {
        "monitor.alsa.rules" = [
          {
            matches = [ { "device.name" = "~alsa_card.usb-MOTU_M4_M4MA049C4N-00"; } ];
            actions.update-props = {
              "device.description" = "Motu M4";
              "device.profile" = "pro-audio";
            };
          }
        ];
      };
    };

    # PipeWire Pro Audio Profile:
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/FAQ#what-is-the-pro-audio-profile
    # Virtual Sources Example:
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/Virtual-Devices#behringer-umc404hd-speakersheadphones-virtual-sinks
    # Node Properties:
    # https://docs.pipewire.org/page_man_pipewire-props_7.html#props__common_node_properties
    extraConfig.pipewire = {
      "10-virtual-devices" = {
        "context.modules" = [
          # Mic In 1L
          {
            name = "libpipewire-module-loopback";
            args = {
              "node.description" = "Motu M4 Mic In 1L";
              "capture.props" = {
                "node.name" = "capture.motu_mic_1L_in";
                "audio.position" = [ "AUX0" ];
                "target.object" = "alsa_input.usb-MOTU_M4_M4MA049C4N-00.pro-input-0";
                "stream.dont-remix" = true;
                "node.passive" = true;
              };
              "playback.props" = {
                "node.name" = "playback.motu_mic_1L_in";
                "media.class" = "Audio/Source";
                "audio.position" = [ "MONO" ];
              };
            };
          }

          # Mic In 2R
          {
            name = "libpipewire-module-loopback";
            args = {
              "node.description" = "Motu M4 Mic In 2R";
              "capture.props" = {
                "node.name" = "capture.motu_mic_2R_in";
                "audio.position" = [ "AUX1" ];
                "target.object" = "alsa_input.usb-MOTU_M4_M4MA049C4N-00.pro-input-0";
                "stream.dont-remix" = true;
                "node.passive" = true;
              };
              "playback.props" = {
                "node.name" = "playback.motu_mic_2R_in";
                "media.class" = "Audio/Source";
                "audio.position" = [ "MONO" ];
              };
            };
          }

          # Stereo Line In L+R
          {
            name = "libpipewire-module-loopback";
            args = {
              "node.description" = "Motu M4 Line In L+R";
              "capture.props" = {
                "node.name" = "capture.motu_stereo_in";
                "audio.position" = [
                  "AUX2"
                  "AUX3"
                ];
                "target.object" = "alsa_input.usb-MOTU_M4_M4MA049C4N-00.pro-input-0";
                "stream.dont-remix" = true;
                "node.passive" = true;
              };
              "playback.props" = {
                "node.name" = "playback.motu_stereo_in";
                "media.class" = "Audio/Source";
                "audio.position" = [
                  "FL"
                  "FR"
                ];
              };
            };
          }

          # Headphone + Monitor Out
          {
            name = "libpipewire-module-loopback";
            args = {
              "node.description" = "Motu M4 Headphone + Monitor Out";
              "capture.props" = {
                "node.name" = "capture.motu_headphone_out";
                "media.class" = "Audio/Sink";
                "audio.position" = [
                  "FL"
                  "FR"
                ];
              };
              "playback.props" = {
                "node.name" = "playback.motu_headphone_out";
                "audio.position" = [
                  "AUX0"
                  "AUX1"
                ];
                "target.object" = "alsa_output.usb-MOTU_M4_M4MA049C4N-00.pro-output-0";
                "stream.dont-remix" = true;
                "node.passive" = true;
              };
            };
          }

          # Line Out
          {
            name = "libpipewire-module-loopback";
            args = {
              "node.description" = "Motu M4 Line Out";
              "capture.props" = {
                "node.name" = "capture.motu_line_out";
                "media.class" = "Audio/Sink";
                "audio.position" = [
                  "FL"
                  "FR"
                ];
              };
              "playback.props" = {
                "node.name" = "playback.motu_line_out";
                "audio.position" = [
                  "AUX2"
                  "AUX3"
                ];
                "target.object" = "alsa_output.usb-MOTU_M4_M4MA049C4N-00.pro-output-0";
                "stream.dont-remix" = true;
                "node.passive" = true;
              };
            };
          }
        ];
      };
    };
  };
}
