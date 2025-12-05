{ ... }:

let
  extension = shortId: uuid: {
    name = uuid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "force_installed";
      default_area = "menupanel";
    };
  };
in
{
  programs.firefox = {
    policies = {
      # Short ID is in the URL (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
      # Extension ID: about:debugging#/runtime/this-firefox
      ExtensionSettings =
        with builtins;
        listToAttrs [
          (extension "control-panel-for-youtube" "control-panel-for-youtube@jbscript.dev")
          (extension "kagi-search-for-firefox" "search@kagi.com")
          (extension "modern-for-hacker-news" "{b9edf38a-e293-4606-a088-e63cd4e56d2d}")
          (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me")
          (extension "react-devtools" "@react-devtools")
          (extension "redirector" "redirector@einaregilsson.com")
          (extension "refined-github-" "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}")
          (extension "sponsorblock" "sponsorBlocker@ajay.app")
          (extension "styl-us" "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}")
          (extension "ublacklist" "@ublacklist")
          (extension "ublock-origin" "uBlock0@raymondhill.net")
          (extension "vercel" "extension@vercel.com")
          (extension "web-clipper-obsidian" "clipper@obsidian.md")
        ];
    };
  };
}
