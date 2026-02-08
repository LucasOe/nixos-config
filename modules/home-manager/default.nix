{ configLib, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Import all configurations
  imports = configLib.scanPaths ./.;

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Enable fontconfig configuration
  fonts.fontconfig.enable = true;

  # Environment variables
  home.sessionVariables = {
    EDITOR = "zeditor";
    VISUAL = "zeditor";
    DIRENV_WARN_TIMEOUT = "120s";
    NODE_OPTIONS = "--no-deprecation";
  };

  # Aliases
  home.shellAliases = {
    cat = "bat";
    fetch = "fastfetch";
    find = "fd";
    g = "git";
    grep = "rg";
    la = "eza -la";
    ll = "eza -l";
    ls = "eza";
    lt = "eza --tree";
    tree = "eza --tree";
    zed = "zeditor";
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
