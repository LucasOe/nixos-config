{ ... }:

let
  toolbarBookmarks = [
    {
      url = "https://mail.proton.me/";
      name = "Proton Mail";
    }
    {
      url = "https://calendar.proton.me/";
      name = "Proton Calendar";
    }
    {
      url = "https://drive.proton.me/";
      name = "Proton Drive";
    }
    {
      url = "https://pass.proton.me/";
      name = "Proton Pass";
    }
    {
      url = "https://github.com/";
      name = "Github";
    }
    {
      url = "https://search.nixos.org/packages?channel=unstable";
      name = "NixOS Search";
    }
    {
      url = "https://home-manager-options.extranix.com/";
      name = "Home Manager";
    }
    {
      url = "https://mynixos.com/";
      name = "MyNixOS";
    }
    {
      url = "https://chatgpt.com/?temporary-chat=true";
      name = "ChatGPT";
    }
    {
      url = "https://drive.google.com/";
      name = "Drive";
    }
    {
      url = "https://my.hshl.de/";
      name = "MyHSHL";
    }
    {
      url = "https://reddit.com/";
      name = "Reddit";
    }
    {
      url = "https://www.youtube.com/";
      name = "Youtube";
    }
    {
      url = "https://bsky.app/";
      name = "Bluesky";
    }
    {
      url = "https://news.ycombinator.com/";
      name = "Hacker News";
    }
    {
      url = "https://www.audible.de/";
      name = "Audible";
    }
    {
      url = "https://www.amazon.de/";
      name = "Amazon";
    }
    {
      url = "https://garmoth.com/";
      name = "Garmoth";
    }
  ];

  # Map 'name' to 'label' and turn into json
  pinned = builtins.toJSON (
    map (b: {
      inherit (b) url;
      label = b.name;
    }) toolbarBookmarks
  );
in
{
  programs.firefox = {
    profiles.default = {
      bookmarks = {
        force = true;
        settings = [
          {
            toolbar = true;
            bookmarks = toolbarBookmarks;
          }
        ];
      };

      # Add the toolbar Bookmarks to the homepage shortcuts
      settings = {
        "browser.newtabpage.pinned" = pinned;
      };
    };
  };
}
