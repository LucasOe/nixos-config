{ ... }:

{
  programs.firefox = {
    profiles.default.search = {
      force = true;
      default = "kagi";
      privateDefault = "kagi";
      engines = {
        kagi = {
          name = "Kagi";
          urls = [ { template = "https://kagi.com/search?q={searchTerms}"; } ];
          icon = "https://kagi.com/favicon.ico";
        };

        # Disable default search engines
        bing.metaData.hidden = true;
        ddg.metaData.hidden = true;
        ecosia.metaData.hidden = true;
        google.metaData.hidden = true;
        perplexity.metaData.hidden = true;
        wikipedia.metaData.hidden = true;
      };
    };
  };
}
