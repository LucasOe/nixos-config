{ ... }:

{
  programs.dank-material-shell = {
    settings = {
      controlCenterWidgets = [
        {
          id = "wifi";
          enabled = true;
          width = 50;
        }
        {
          id = "builtin_vpn";
          enabled = true;
          width = 50;
        }
        {
          id = "bluetooth";
          enabled = true;
          width = 50;
        }
        {
          id = "battery";
          enabled = true;
          width = 50;
        }
        {
          id = "audioOutput";
          enabled = true;
          width = 50;
        }
        {
          id = "audioInput";
          enabled = true;
          width = 50;
        }
        {
          id = "volumeSlider";
          enabled = true;
          width = 50;
        }
        {
          id = "inputVolumeSlider";
          enabled = true;
          width = 50;
        }
      ];
    };
  };
}
