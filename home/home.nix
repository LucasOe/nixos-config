{ pkgs, ... }:

{
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  imports = [
    ./niri
    ./dms
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    nixfmt-rfc-style
  ];

  # Git
  programs.git = {
    enable = true;
    settings = {
      user.name = "LucasOe";
      user.email = "github@lucasoe.com";
    };
  };

  # Starship
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # Kitty
  programs.kitty = {
    enable = true;
    settings = {
      window_padding_width = 10;
    };
  };

  # Bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

  # Firefox
  programs.firefox = {
    enable = true;
  };

  # Clipboard Manager
  services.cliphist = {
    enable = true;
    allowImages = true;
  };
}
