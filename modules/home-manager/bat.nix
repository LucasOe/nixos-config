{ ... }:

{
  programs.bat = {
    enable = true;
  };

  home.shellAliases = {
    cat = "bat";
  };

  stylix.targets.bat = {
    enable = true;
  };
}
