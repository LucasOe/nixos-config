{ pkgs, ... }:

{
  programs.firefox = {
    profiles.default.extensions = {
      force = true;

      # https://gitlab.com/rycee/nur-expressions/blob/master/pkgs/firefox-addons/generated-firefox-addons.nix
      packages = with pkgs.nur.repos.rycee.firefox-addons; [
        kagi-search
        proton-pass
        ublock-origin
      ];
    };
  };
}
