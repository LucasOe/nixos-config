{ ... }:

{
  programs.firefox = {
    # Firefox has to be installed system wide for policies to work
    # https://mozilla.github.io/policy-templates/
    policies = {
      AllowFileSelectionDialogs = true;
      AppAutoUpdate = false;
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BackgroundAppUpdate = false;
      BlockAboutAddons = false;
      BlockAboutConfig = false;
      BlockAboutProfiles = false;
      BlockAboutSupport = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = false;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableMasterPasswordCreation = true;
      DisablePocket = true;
      DisablePrivateBrowsing = false;
      DisableProfileImport = false;
      DisableProfileRefresh = false;
      DisableSafeMode = false;
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
      };
      EncryptedMediaExtensions = {
        Enabled = true;
      };
      ExtensionUpdate = true;
      FirefoxHome = {
        Search = false;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = false;
      };
      HardwareAcceleration = true;
      ManualAppUpdateOnly = true;
      NoDefaultBookmarks = false;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      PasswordManagerEnabled = false;
      PictureInPicture = {
        Enabled = true;
      };
      PopupBlocking = {
        Allow = [ ];
        Default = true;
      };
      PromptForDownloadLocation = true;
      SearchEngines = {
        PreventInstalls = true;
      };
      SearchSuggestEnabled = false;
      ShowHomeButton = false;
      StartDownloadsInTempDirectory = false;
      UserMessaging = {
        ExtensionRecommendations = false;
        SkipOnboarding = true;
      };
    };
  };
}
