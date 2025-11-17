{ ... }:

{
  programs.firefox = {
    profiles.default = {
      settings = {
        "browser.search.defaultenginename" = "Kagi";
        "browser.search.order.0" = "Kagi";
      };
      search = {
        force = true;
        default = "Kagi";
        engines = {
          "Kagi" = {
            urls = [
              {
                template = "https://kagi.com/search?q={searchTerms}";
              }
            ];
            iconUpdateURL = "https://kagi.com/favicon.ico";
          };
        };
      };
    };
  };
}
