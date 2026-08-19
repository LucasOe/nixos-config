{ ... }:

{
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--header"
      "--sort=type"
      "--no-permissions"
      "--hyperlink=auto"
      "--level=3"
      "--git-ignore"
      "--time=created"
      "--time-style=long-iso"
      "--short-nix"
      "--loc"
    ];
  };

  home.shellAliases = {
    la = "eza -la";
    ll = "eza -l";
    ls = "eza";
    lt = "eza --tree";
    tree = "eza --tree";
  };
}
