{ ... }:

let
  extension = shortId: uuid: private: {
    name = uuid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "force_installed";
      default_area = "menupanel";
      private_browsing = private;
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
          (extension "audible-volume-control" "{6416fba2-1151-4e0b-ad65-1c36b3994ef1}" false)
          (extension "control-panel-for-youtube" "control-panel-for-youtube@jbscript.dev" false)
          (extension "dictionary-german" "de-DE@dictionaries.addons.mozilla.org" false)
          (extension "kagi-search-for-firefox" "search@kagi.com" true)
          (extension "kagi-translate" "{bd6be57d-91d7-41d2-b61d-3ba20f7942e5}" false)
          (extension "modern-for-hacker-news" "{b9edf38a-e293-4606-a088-e63cd4e56d2d}" false)
          (extension "proton-pass" "78272b6fa58f4a1abaac99321d503a20@proton.me" true)
          (extension "react-devtools" "@react-devtools" false)
          (extension "redirector" "redirector@einaregilsson.com" false)
          (extension "refined-github-" "{a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad}" false)
          (extension "sink-it-for-reddit" "{09acf9ff-55d4-4366-a1a9-c9b3c8877c09}" false)
          (extension "sponsorblock" "sponsorBlocker@ajay.app" false)
          (extension "styl-us" "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" false)
          (extension "ublacklist" "@ublacklist" false)
          (extension "ublock-origin" "uBlock0@raymondhill.net" true)
          (extension "vercel" "extension@vercel.com" false)
          (extension "web-clipper-obsidian" "clipper@obsidian.md" false)
        ];
    };
  };
}
