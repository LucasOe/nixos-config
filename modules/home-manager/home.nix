{ username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Enable fontconfig configuration
  fonts.fontconfig.enable = true;

  # Environment variables
  home.sessionVariables = {
    EDITOR = "zeditor";
    VISUAL = "zeditor";
    NODE_OPTIONS = "--no-deprecation";
    PROTON_PASS_LINUX_KEYRING = "dbus"; # https://protonpass.github.io/pass-cli/get-started/configuration/#secure-key-storage
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
}
