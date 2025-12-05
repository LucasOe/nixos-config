{ ... }:

let
  extension = id: builtins.replaceStrings [ "@" "." ] [ "_" "_" ] id + "-browser-action";
in
{
  programs.firefox = {
    profiles.default.settings = {
      "browser.uiCustomization.state" = builtins.toJSON {
        placements = {
          widget-overflow-fixed-list = [ ];
          unified-extensions-area = [ ];
          nav-bar = [
            "back-button"
            "forward-button"
            "stop-reload-button"
            "customizableui-special-spring1"
            "home-button"
            "urlbar-container"
            "customizableui-special-spring2"
            "downloads-button"
            # "developer-button"
            "bookmarks-menu-button"
            "unified-extensions-button"

            # Extensions
            (extension "78272b6fa58f4a1abaac99321d503a20@proton.me")
            (extension "clipper@obsidian.md")
          ];
          toolbar-menubar = [
            "menubar-items"
          ];
          TabsToolbar = [
            "tabbrowser-tabs"
            "new-tab-button"
            "alltabs-button"
          ];
          vertical-tabs = [
            "tabbrowser-tabs"
          ];
          PersonalToolbar = [
            "personal-bookmarks"
          ];
        };
        seen = [ ];
        currentVersion = 23;
        newElementCount = 0;
      };
    };
  };
}
