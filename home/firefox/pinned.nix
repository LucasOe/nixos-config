{ ... }:

{
  programs.firefox = {
    profiles.default.settings = {
      "browser.newtabpage.pinned" = builtins.toJSON [
        {
          url = "https://mail.proton.me/u/1/";
          label = "Proton Mail";
        }
        {
          url = "https://calendar.proton.me/u/1/";
          label = "Proton Calendar";
        }
        {
          url = "https://drive.proton.me/u/1/";
          label = "Proton Drive";
        }
        {
          url = "https://pass.proton.me/";
          label = "Proton Pass";
        }
        {
          url = "https://notion.so/";
          label = "Notion";
        }
        {
          url = "https://chatgpt.com/?temporary-chat=true";
          label = "ChatGPT";
        }
        {
          url = "https://drive.google.com/";
          label = "Drive";
        }
        {
          url = "https://my.hshl.de/";
          label = "MyHSHL";
        }
        {
          url = "https://reddit.com/";
          label = "Reddit";
        }
        {
          url = "https://www.youtube.com/";
          label = "Youtube";
        }
        {
          url = "https://bsky.app/";
          label = "Bluesky";
        }
        {
          url = "https://news.ycombinator.com/";
          label = "Hacker News";
        }
        {
          url = "https://github.com/";
          label = "Github";
        }
        {
          url = "https://www.audible.de/";
          label = "Audible";
        }
        {
          url = "https://www.amazon.de/";
          label = "Amazon";
        }
        {
          url = "https://garmoth.com/";
          label = "Garmoth";
        }
      ];
    };
  };
}
