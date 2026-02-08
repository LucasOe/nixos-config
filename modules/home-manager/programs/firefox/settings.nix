{ ... }:

{
  programs.firefox = {
    profiles.default.settings = {
      # Betterfox
      # version: 146
      # https://github.com/yokoffing/Betterfox

      # ============================================================================
      # SECTION: FASTFOX
      # ============================================================================

      # GENERAL
      "gfx.content.skia-font-cache-size" = 32;
      # GFX
      "gfx.webrender.layer-compositor" = true;
      "gfx.canvas.accelerated.cache-items" = 32768;
      "gfx.canvas.accelerated.cache-size" = 4096;
      "webgl.max-size" = 16384;
      # DISK CACHE
      "browser.cache.disk.enable" = false;
      # MEMORY CACHE
      "browser.cache.memory.capacity" = 131072;
      "browser.cache.memory.max_entry_size" = 20480;
      "browser.sessionhistory.max_total_viewers" = 4;
      "browser.sessionstore.max_tabs_undo" = 10;
      # MEDIA CACHE
      "media.memory_cache_max_size" = 262144;
      "media.memory_caches_combined_limit_kb" = 1048576;
      "media.cache_readahead_limit" = 600;
      "media.cache_resume_threshold" = 300;
      # IMAGE CACHE
      "image.cache.size" = 10485760;
      "image.mem.decode_bytes_at_a_time" = 65536;
      # NETWORK
      "network.http.max-connections" = 1800;
      "network.http.max-persistent-connections-per-server" = 10;
      "network.http.max-urgent-start-excessive-connections-per-host" = 5;
      "network.http.request.max-start-delay" = 5;
      "network.http.pacing.requests.enabled" = false;
      "network.dnsCacheEntries" = 10000;
      "network.dnsCacheExpiration" = 3600;
      "network.ssl_tokens_cache_capacity" = 10240;
      # SPECULATIVE LOADING
      "network.http.speculative-parallel-limit" = 0;
      "network.dns.disablePrefetch" = true;
      "network.dns.disablePrefetchFromHTTPS" = true;
      "browser.urlbar.speculativeConnect.enabled" = false;
      "browser.places.speculativeConnect.enabled" = false;
      "network.prefetch-next" = false;

      # ============================================================================
      # SECTION: SECUREFOX
      # ============================================================================

      # TRACKING PROTECTION
      "browser.contentblocking.category" = "strict";
      "browser.download.start_downloads_in_tmp_dir" = true;
      "browser.uitour.enabled" = false;
      "privacy.globalprivacycontrol.enabled" = true;
      # OCSP & CERTS / HPKP
      "security.OCSP.enabled" = 0;
      "privacy.antitracking.isolateContentScriptResources" = true;
      "security.csp.reporting.enabled" = false;
      # SSL / TLS
      "security.ssl.treat_unsafe_negotiation_as_broken" = true;
      "browser.xul.error_pages.expert_bad_cert" = true;
      "security.tls.enable_0rtt_data" = false;
      # HTTPS-ONLY MODE
      "dom.security.https_only_mode" = true;
      "dom.security.https_only_mode_error_page_user_suggestions" = true;
      # DISK AVOIDANCE
      "browser.privatebrowsing.forceMediaMemoryCache" = true;
      "browser.sessionstore.interval" = 60000;
      # SHUTDOWN & SANITIZING
      "privacy.history.custom" = true;
      "browser.privatebrowsing.resetPBM.enabled" = true;
      # SEARCH / URL BAR
      "browser.urlbar.trimHttps" = true;
      "browser.urlbar.untrimOnUserInteraction.featureGate" = true;
      "browser.search.separatePrivateDefault.ui.enabled" = true;
      "browser.search.suggest.enabled" = false;
      "browser.urlbar.quicksuggest.enabled" = false;
      "browser.urlbar.groupLabels.enabled" = false;
      "browser.formfill.enable" = false;
      "network.IDN_show_punycode" = true;
      # PASSWORDS
      "signon.formlessCapture.enabled" = false;
      "signon.privateBrowsingCapture.enabled" = false;
      "network.auth.subresource-http-auth-allow" = 1;
      "editor.truncate_user_pastes" = false;
      # EXTENSIONS
      "extensions.enabledScopes" = 5;
      # HEADERS / REFERERS
      "network.http.referer.XOriginTrimmingPolicy" = 2;
      # CONTAINERS
      "privacy.userContext.ui.enabled" = true;
      # VARIOUS
      "pdfjs.enableScripting" = false;
      # SAFE BROWSING
      "browser.safebrowsing.downloads.remote.enabled" = false;
      # MOZILLA
      "permissions.default.desktop-notification" = 2;
      "permissions.default.geo" = 2;
      "geo.provider.network.url" = "https://beacondb.net/v1/geolocate";
      "browser.search.update" = false;
      "permissions.manager.defaultsUrl" = "";
      "extensions.getAddons.cache.enabled" = false;
      # TELEMETRY
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
      # EXPERIMENTS
      "app.shield.optoutstudies.enabled" = false;
      "app.normandy.enabled" = false;
      "app.normandy.api_url" = "";
      # CRASH REPORTS
      "breakpad.reportURL" = "";
      "browser.tabs.crashReporting.sendReport" = false;

      # ============================================================================
      # SECTION: PESKYFOX
      # ============================================================================

      # MOZILLA UI
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
      "browser.profiles.enabled" = true;
      # THEME ADJUSTMENTS
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      "browser.compactmode.show" = true;
      # AI
      "browser.ml.enable" = false;
      "browser.ml.chat.enabled" = false;
      "browser.ml.chat.menu" = false;
      "browser.tabs.groups.smart.enabled" = false;
      "browser.ml.linkPreview.enabled" = false;
      # FULLSCREEN NOTICE
      "full-screen-api.transition-duration.enter" = "0 0";
      "full-screen-api.transition-duration.leave" = "0 0";
      "full-screen-api.warning.timeout" = 0;
      # URL BAR
      "browser.urlbar.trending.featureGate" = false;
      # NEW TAB PAGE
      "browser.newtabpage.activity-stream.default.sites" = "";
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
      "browser.newtabpage.activity-stream.showSponsored" = false;
      "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
      # DOWNLOADS
      "browser.download.manager.addToRecentDocs" = false;
      # PDF
      "browser.download.open_pdf_attachments_inline" = true;
      # TAB BEHAVIOR
      "browser.bookmarks.openInTabClosesMenu" = false;
      "browser.menu.showViewImageInfo" = true;
      "findbar.highlightAll" = true;
      "layout.word_select.eat_space_to_next_word" = false;

      # ============================================================================
      # SECTION: SMOOTHFOX
      # ============================================================================

      # SMOOTH SCROLLING
      "general.smoothScroll" = true;
      "general.smoothScroll.msdPhysics.enabled" = true;

      # ============================================================================
      # START: MY OVERRIDES
      # ============================================================================

      # Peskyfox
      # PREF: minimize URL bar suggestions (bookmarks, history, open tabs)
      "browser.urlbar.suggest.history" = false;
      "browser.urlbar.suggest.bookmark" = true;
      "browser.urlbar.suggest.clipboard" = false;
      "browser.urlbar.suggest.openpage" = false;
      "browser.urlbar.suggest.engines" = false;
      "browser.urlbar.suggest.searches" = false;
      "browser.urlbar.quickactions.enabled" = false;
      "browser.urlbar.suggest.weather" = true;
      "browser.urlbar.weather.ignoreVPN" = false;
      "browser.urlbar.suggest.calculator" = true;
      "browser.urlbar.unitConversion.enabled" = true;

      # Securefox
      # PREF: disable password manager
      "signon.rememberSignons" = false;
      "signon.schemeUpgrades" = true;
      "signon.showAutoCompleteFooter" = true;
      "signon.autologin.proxy" = false;
      # PREF: disable auto-filling username & password form fields
      "signon.autofillForms" = false;
      "signon.autofillForms.autocompleteOff" = true;
      # PREF: disable Firefox built-in password generator
      "signon.generation.enabled" = false;
      # PREF: disable Firefox Lockwise (about:logins)
      "signon.management.page.breach-alerts.enabled" = false;
      "signon.management.page.breachAlertUrl" = "";
      "browser.contentblocking.report.lockwise.enabled" = false;
      "browser.contentblocking.report.lockwise.how_it_works.url" = "";
      # PREF: disable Firefox Relay
      "signon.firefoxRelay.feature" = "";
      # PREF: disable websites autocomplete
      "signon.storeWhenAutocompleteOff" = false;
      # PREF: disable form autofill
      "extensions.formautofill.addresses.enabled" = false;
      "extensions.formautofill.creditCards.enabled" = false;

      # ============================================================================
      # START: CUSTOM
      # ============================================================================

      # Set DNS-over-HTTPS (DoH) provider
      "network.trr.uri" = "https://dns.nextdns.io/fcc66c/firefox";
      # Enforce DNS-over-HTTPS (DoH)
      "network.trr.mode" = 2;
      "network.trr.max-fails" = 5;

      # This preference is required to recolor the icons
      "svg.context-properties.content.enabled" = true;

      # Automatically enable extensions
      "extensions.autoDisableScopes" = 0;

      # Enable the ability of web pages to open popups in response to user actions
      # Used by the Obsidian Web Clipper extension
      "extensions.openPopupWithoutUserGesture.enabled" = true;

      # Keep the download button visible
      "browser.download.autohideButton" = false;

      # Hide translation popup
      "browser.translations.automaticallyPopup" = false;

      # Disable middle-click paste
      "middlemouse.paste" = false;

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
      "gnomeTheme.noThemedIcons" = false; # Broken since version 147.0
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
