{ ... }:

{
  programs.firefox = {
    # Firefox has to be installed system wide for policies to work
    # https://mozilla.github.io/policy-templates/
    policies = {
      AppAutoUpdate = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "never";
      DNSOverHTTPS = {
        Enabled = true;
      };
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };
      FirefoxHome = {
        Highlights = false;
        Search = false;
        Snippets = false;
        SponsoredStories = false;
        SponsoredTopSites = false;
        Stories = false;
        TopSites = false;
      };
      GenerativeAI = {
        Enabled = false;
        Locked = true;
      };
      HardwareAcceleration = true;
      ManualAppUpdateOnly = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      SearchEngines = {
        PreventInstalls = true;
      };
      SkipTermsOfUse = true;
      TranslateEnabled = false;
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        Locked = true;
      };
    };
  };
}
