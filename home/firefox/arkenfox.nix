{ inputs, ... }:

{
  imports = [ inputs.arkenfox.hmModules.default ];

  programs.firefox = {
    # Enable Arkenfox
    arkenfox.enable = true;
    arkenfox.version = "master";
    profiles.default.arkenfox = {
      enable = true;

      # STARTUP
      "0100" = {
        enable = true;
        # Startup and Newtab page
        "0102"."browser.startup.page".value = 1;
        "0103"."browser.startup.homepage".value = "about:home";
        "0104"."browser.newtabpage.enabled".value = true;
      };

      # GEOLOCATION
      "0200" = {
        enable = true;
      };

      # QUIETER FOX
      "0300" = {
        enable = true;
      };

      # BLOCK IMPLICIT OUTBOUND
      "0600" = {
        enable = true;
      };

      # DNS / DoH / PROXY / SOCKS
      "0700" = {
        enable = true;
      };

      # LOCATION BAR / SEARCH BAR / SUGGESTIONS / HISTORY / FORMS
      "0800" = {
        enable = true;
        # Disable separate default search engine in Private Windows
        "0830"."browser.search.separatePrivateDefault".value = false;
        "0830"."browser.search.separatePrivateDefault.ui.enabled".value = false;
      };

      # PASSWORDS
      "0900" = {
        enable = true;
      };

      # HTTPS (SSL/TLS / OCSP / CERTS / HPKP)
      "1200" = {
        enable = true;
      };

      # REFERERS
      "1600" = {
        enable = true;
      };

      # CONTAINERS
      "1700" = {
        enable = true;
      };

      # PLUGINS / MEDIA / WEBRTC
      "2000" = {
        enable = true;
      };

      # DOM (DOCUMENT OBJECT MODEL)
      "2400" = {
        enable = true;
      };

      # MISCELLANEOUS
      "2600" = {
        enable = true;
        # Enable download directory
        "2651"."browser.download.useDownloadDir".value = true;
      };

      # ETP (ENHANCED TRACKING PROTECTION)
      "2700" = {
        enable = true;
      };

      # FPP (fingerprintingProtection)
      "4000" = {
        enable = true;
      };

      # DON'T TOUCH
      "6000" = {
        enable = true;
      };

      # TELEMETRY
      "8500" = {
        enable = true;
      };

      # NON-PROJECT RELATED
      "9000" = {
        enable = true;
      };
    };
  };
}
