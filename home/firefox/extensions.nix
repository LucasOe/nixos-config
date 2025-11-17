{ pkgs, ... }:

{
  programs.firefox = {
    profiles.default = {
      extensions.force = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        firefox-color
        kagi-search
        proton-pass
        ublock-origin
      ];
    };
  };
}
