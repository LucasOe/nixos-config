{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    kdePackages.qttools # Required by the Noctalia Plugins
  ];

  programs.kdeconnect = {
    enable = true;
  };
}
