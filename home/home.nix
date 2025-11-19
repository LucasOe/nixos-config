{ pkgs, ... }:

{
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  imports = [
    ./firefox
    ./kitty
    ./niri
    ./noctalia
  ];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Enable fontconfig configuration
  fonts.fontconfig.enable = true;

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
    nixd
    devenv
  ];

  # XDG
  xdg = {
    enable = true;
    # Hide desktop entries
    desktopEntries = {
      qt5ct = {
        name = "Qt5 Settings";
        noDisplay = true;
      };
      qt6ct = {
        name = "Qt6 Settings";
        noDisplay = true;
      };
      kvantummanager = {
        name = "Kvantum Manager";
        noDisplay = true;
      };
    };
  };

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

  # Bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };
}
