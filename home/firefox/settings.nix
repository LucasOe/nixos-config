{ ... }:

{
  programs.firefox = {
    profiles.default = {
      settings = {
        # Set UI scaling
        "layout.css.devPixelsPerPx" = 1.5;

        # Automatically enable extensions
        "extensions.autoDisableScopes" = 0;

        # Allow userChrome/userContent
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        # Allow unsigned extension
        "xpinstall.signatures.required" = false;

        # Disable the accesskey
        "ui.key.menuAccessKey" = 0;

        # Enable the ability of web pages to open popups in response to user actions
        # Used by the Obsidian Web Clipper extension
        "extensions.openPopupWithoutUserGesture.enabled" = true;

        # Keep the download button visible
        "browser.download.autohideButton" = false;

        # Disable AI features
        "browser.ml.chat.enabled" = false;
        "browser.tabs.groups.smart.enabled" = false;
        "browser.tabs.groups.smart.userEnabled" = false;

        # Enable Firefox to clear items on shutdown
        "privacy.sanitize.sanitizeOnShutdown" = true;
        # Categories of data to be cleared on shutdown
        "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
        "privacy.clearOnShutdown_v2.cache" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "privacy.clearOnShutdown_v2.downloads" = true;
        "privacy.clearOnShutdown_v2.formdata" = true;
        "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
        "privacy.clearOnShutdown_v2.siteSettings" = false;
        # Categories of data to be cleared in the clear history or browser context
        # Firefox remembers your last choices. This will reset them when you start Firefox
        "privacy.clearHistory.browsingHistoryAndDownloads" = true;
        "privacy.clearHistory.cache" = false;
        "privacy.clearHistory.cookiesAndStorage" = false;
        "privacy.clearHistory.downloads" = true;
        "privacy.clearHistory.formdata" = true;
        "privacy.clearHistory.historyFormDataAndDownloads" = true;
        "privacy.clearHistory.siteSettings" = false;
        # Categories of data to be cleared in the clear site data context
        # Firefox remembers your last choices. This will reset them when you start Firefox
        "privacy.clearSiteData.browsingHistoryAndDownloads" = true;
        "privacy.clearSiteData.cache" = false;
        "privacy.clearSiteData.cookiesAndStorage" = false;
        "privacy.clearSiteData.downloads" = true;
        "privacy.clearSiteData.formdata" = true;
        "privacy.clearSiteData.historyFormDataAndDownloads" = true;
        "privacy.clearSiteData.siteSettings" = false;

        # Disable saving passwords
        "signon.rememberSignons" = false;
        # Disable "Suggest and generate strong passwords"
        "signon.generation.enabled" = false;
        # Disable "Show alerts about passwords for breached websites"
        "signon.management.page.breach-alerts.enabled" = false;
        "signon.management.page.breachAlertUrl" = "";

        # Disable location bar suggestion types
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.bookmark" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.clipboard" = false;
        "browser.urlbar.suggest.mdn" = false;
        "browser.urlbar.suggest.pocket" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.suggest.calculator" = true;

        # Disable form autofill
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
      };
    };
  };
}
