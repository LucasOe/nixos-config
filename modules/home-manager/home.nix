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
    NODE_OPTIONS = "--no-deprecation";
    PROTON_PASS_LINUX_KEYRING = "dbus"; # https://protonpass.github.io/pass-cli/get-started/configuration/#secure-key-storage
  };
}
