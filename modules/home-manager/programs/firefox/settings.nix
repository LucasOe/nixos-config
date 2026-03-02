{ ... }:

{
  programs.firefox = {
    profiles.default.settings = {
      # Betterfox
      # version: 148.0
      # https://github.com/yokoffing/Betterfox

      # ============================================================================
      # START: FASTFOX
      # ============================================================================

      # SECTION: GFX RENDERING TWEAKS
      "gfx.webrender.layer-compositor" = true;

      # ============================================================================
      # START: SECUREFOX
      # ============================================================================

      # SECTION: TRACKING PROTECTION
      "browser.contentblocking.category" = "strict";
      "browser.download.start_downloads_in_tmp_dir" = true;
      "browser.uitour.enabled" = false;
      "privacy.globalprivacycontrol.enabled" = true;
      # SECTION: OCSP & CERTS / HPKP (HTTP Public Key Pinning)
      "security.OCSP.enabled" = 0;
      "privacy.antitracking.isolateContentScriptResources" = true;
      "security.csp.reporting.enabled" = false;
      # SECTION: SSL (Secure Sockets Layer) / TLS (Transport Layer Security)
      "security.ssl.treat_unsafe_negotiation_as_broken" = true;
      "browser.xul.error_pages.expert_bad_cert" = true;
      "security.tls.enable_0rtt_data" = false;
      # SECTION: DISK AVOIDANCE
      "browser.cache.disk.enable" = false;
      "browser.privatebrowsing.forceMediaMemoryCache" = true;
      "media.memory_cache_max_size" = 65536;
      "browser.sessionstore.interval" = 60000;
      # SECTION: SANITIZE HISTORY
      "privacy.clearHistory.browsingHistoryAndDownloads" = true;
      "privacy.clearHistory.cache" = false;
      "privacy.clearHistory.cookiesAndStorage" = false;
      "privacy.clearHistory.downloads" = true;
      "privacy.clearHistory.formdata" = true;
      "privacy.clearHistory.historyFormDataAndDownloads" = true;
      "privacy.clearHistory.siteSettings" = false;
      "privacy.clearSiteData.browsingHistoryAndDownloads" = true;
      "privacy.clearSiteData.cache" = false;
      "privacy.clearSiteData.cookiesAndStorage" = false;
      "privacy.clearSiteData.downloads" = true;
      "privacy.clearSiteData.formdata" = true;
      "privacy.clearSiteData.historyFormDataAndDownloads" = true;
      "privacy.clearSiteData.siteSettings" = false;
      "browser.privatebrowsing.resetPBM.enabled" = true;
      # SECTION: SHUTDOWN & SANITIZING
      "privacy.history.custom" = true;
      "privacy.sanitize.sanitizeOnShutdown" = true;
      "privacy.clearOnShutdown_v2.browsingHistoryAndDownloads" = true;
      "privacy.clearOnShutdown_v2.cache" = false;
      "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
      "privacy.clearOnShutdown_v2.downloads" = true;
      "privacy.clearOnShutdown_v2.formdata" = true;
      "privacy.clearOnShutdown_v2.historyFormDataAndDownloads" = true;
      "privacy.clearOnShutdown_v2.siteSettings" = false;
      # SECTION: SPECULATIVE LOADING
      "network.http.speculative-parallel-limit" = 0;
      "network.dns.disablePrefetch" = true;
      "network.dns.disablePrefetchFromHTTPS" = true;
      "browser.urlbar.speculativeConnect.enabled" = false;
      "browser.places.speculativeConnect.enabled" = false;
      "network.prefetch-next" = false;
      # SECTION: SEARCH / URL BAR
      "browser.urlbar.trimHttps" = true;
      "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
      "browser.search.separatePrivateDefault.ui.enabled" = true;
      "browser.search.suggest.enabled" = false;
      "browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.groupLabels.enabled" = false;
      "browser.formfill.enable" = false;
      "network.IDN_show_punycode" = true;
      # SECTION: HTTPS-ONLY MODE
      "dom.security.https_only_mode" = true;
      "dom.security.https_only_mode_error_page_user_suggestions" = true;
      # SECTION: DNS-over-HTTPS
      "network.trr.mode" = 2;
      "network.trr.max-fails" = 5;
      "network.trr.uri" = "https://dns.nextdns.io/fcc66c/firefox";
      # SECTION: PASSWORDS
      "signon.rememberSignons" = false;
      "signon.schemeUpgrades" = true;
      "signon.showAutoCompleteFooter" = true;
      "signon.autologin.proxy" = false;
      "signon.autofillForms" = false;
      "signon.autofillForms.autocompleteOff" = true;
      "signon.formlessCapture.enabled" = false;
      "signon.privateBrowsingCapture.enabled" = false;
      "signon.generation.enabled" = false;
      "signon.management.page.breach-alerts.enabled" = false;
      "signon.management.page.breachAlertUrl" = "";
      "browser.contentblocking.report.lockwise.enabled" = false;
      "browser.contentblocking.report.lockwise.how_it_works.url" = "";
      "signon.firefoxRelay.feature" = "";
      "signon.storeWhenAutocompleteOff" = false;
      "network.auth.subresource-http-auth-allow" = 1;
      "editor.truncate_user_pastes" = false;
      # SECTION: ADDRESS + CREDIT CARD MANAGER
      "extensions.formautofill.addresses.enabled" = false;
      "extensions.formautofill.creditCards.enabled" = false;
      # SECTION: EXTENSIONS
      "extensions.enabledScopes" = 5;
      "extensions.autoDisableScopes" = 0;
      # SECTION: HEADERS / REFERERS
      "network.http.referer.XOriginTrimmingPolicy" = 2;
      # SECTION: CONTAINERS
      "privacy.userContext.ui.enabled" = true;
      # SECTION: VARIOUS
      "pdfjs.enableScripting" = false;
      # SECTION: SAFE BROWSING
      "browser.safebrowsing.downloads.remote.enabled" = false;
      # SECTION: MOZILLA
      "permissions.default.desktop-notification" = 2;
      "permissions.default.geo" = 2;
      "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
      "browser.search.update" = false;
      "permissions.manager.defaultsUrl" = "";
      "extensions.getAddons.cache.enabled" = false;
      # SECTION: TELEMETRY
      "datareporting.policy.dataSubmissionEnabled" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "toolkit.telemetry.unified" = false;
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.server" = "data:,";
      "toolkit.telemetry.archive.enabled" = false;
      "toolkit.telemetry.newProfilePing.enabled" = false;
      "toolkit.telemetry.shutdownPingSender.enabled" = false;
      "toolkit.telemetry.updatePing.enabled" = false;
      "toolkit.telemetry.bhrPing.enabled" = false;
      "toolkit.telemetry.firstShutdownPing.enabled" = false;
      "toolkit.telemetry.coverage.opt-out" = true;
      "toolkit.coverage.opt-out" = true;
      "toolkit.coverage.endpoint.base" = "";
      "browser.newtabpage.activity-stream.feeds.telemetry" = false;
      "browser.newtabpage.activity-stream.telemetry" = false;
      "datareporting.usage.uploadEnabled" = false;
      # SECTION: EXPERIMENTS
      "app.shield.optoutstudies.enabled" = false;
      "app.normandy.enabled" = false;
      "app.normandy.api_url" = "";
      # SECTION: CRASH REPORTS
      "breakpad.reportURL" = "";
      "browser.tabs.crashReporting.sendReport" = false;

      # ============================================================================
      # START: PESKYFOX
      # ============================================================================

      # SECTION: MOZILLA UI
      "extensions.getAddons.showPane" = false;
      "extensions.htmlaboutaddons.recommendations.enabled" = false;
      "browser.discovery.enabled" = false;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
      "browser.preferences.moreFromMozilla" = false;
      "browser.aboutConfig.showWarning" = false;
      "browser.startup.homepage_override.mstone" = "ignore";
      "browser.aboutwelcome.enabled" = false;
      "browser.messaging-system.whatsNewPanel.enabled" = false;
      "browser.profiles.enabled" = true;
      # SECTION: THEME ADJUSTMENTS
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.compactmode.show" = true;
      # SECTION: AI
      "browser.ai.control.default" = "blocked";
      "browser.ml.enable" = false;
      "browser.ml.chat.enabled" = false;
      "browser.ml.chat.menu" = false;
      "browser.tabs.groups.smart.enabled" = false;
      "browser.ml.linkPreview.enabled" = false;
      # SECTION: FULLSCREEN NOTICE
      "full-screen-api.transition-duration.enter" = "0 0";
      "full-screen-api.transition-duration.leave" = "0 0";
      "full-screen-api.warning.timeout" = 0;
      # SECTION: URL BAR
      "browser.urlbar.trending.featureGate" = false;
      "browser.urlbar.suggest.history" = false;
      "browser.urlbar.suggest.bookmark" = false;
      "browser.urlbar.suggest.clipboard" = false;
      "browser.urlbar.suggest.openpage" = false;
      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.urlbar.quickactions.enabled" = false;
      "browser.urlbar.suggest.weather" = false;
      "browser.urlbar.weather.ignoreVPN" = false;
      "browser.urlbar.suggest.calculator" = true;
      "browser.urlbar.unitConversion.enabled" = true;
      # SECTION: NEW TAB PAGE
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
      "browser.newtabpage.activity-stream.default.sites" = "";
      # SECTION: DOWNLOADS
      "browser.download.autohideButton" = false;
      "browser.download.manager.addToRecentDocs" = false;
      # SECTION: PDF
      "browser.download.open_pdf_attachments_inline" = true;
      # SECTION: TAB BEHAVIOR
      "browser.bookmarks.openInTabClosesMenu" = false;
      "browser.menu.showViewImageInfo" = true;
      "findbar.highlightAll" = true;
      "layout.word_select.eat_space_to_next_word" = false;

      # ============================================================================
      # START: SMOOTHFOX
      # ============================================================================

      # SECTION: SMOOTH SCROLLING
      "general.smoothScroll" = true;
      "general.smoothScroll.msdPhysics.enabled" = true;

      # ============================================================================
      # START: OTHER
      # ============================================================================

      # PREF: enable the non-standard `-moz-context-properties` CSS property
      "svg.context-properties.content.enabled" = true;
      # PREF: enable the ability of web pages to open popups in response to user actions
      "extensions.openPopupWithoutUserGesture.enabled" = true;
      # PREF: hide translation popup
      "browser.translations.automaticallyPopup" = false;
      # PREF: disable middle-click paste
      "middlemouse.paste" = false;

      # ============================================================================
      # START: GNOME THEME
      # ============================================================================

      "gnomeTheme.hideSingleTab" = false;
      "gnomeTheme.normalWidthTabs" = true;
      "gnomeTheme.swapTabClose" = false;
      "gnomeTheme.bookmarksToolbarUnderTabs" = true;
      "gnomeTheme.activeTabContrast" = false;
      "gnomeTheme.closeOnlySelectedTabs" = false;
      "gnomeTheme.systemIcons" = false;
      "gnomeTheme.noThemedIcons" = false;
      "gnomeTheme.symbolicTabIcons" = false;
      "gnomeTheme.hideWebrtcIndicator" = false;
      "gnomeTheme.hideUnifiedExtensions" = false;
      "gnomeTheme.dragWindowHeaderbarButtons" = false;
      "gnomeTheme.tabsAsHeaderbar" = true;
      "gnomeTheme.oledBlack" = false;
      "gnomeTheme.allTabsButtonOnOverflow" = false;
      "gnomeTheme.allTabsButton" = false;
      "gnomeTheme.tabAlignLeft" = true;
      "gnomeTheme.bookmarksOnFullscreen" = false;
    };
  };
}
