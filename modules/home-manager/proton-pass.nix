{ pkgs, ... }:

{
  home.packages = with pkgs; [ proton-pass-cli ];

  # https://protonpass.github.io/pass-cli/get-started/configuration/#secure-key-storage
  home.sessionVariables.PROTON_PASS_LINUX_KEYRING = "dbus";
}
