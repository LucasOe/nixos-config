{ ... }:

{
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      syntax-theme = "base16";
      line-numbers = true;
      paging = "always";
      # Hyperlinks
      hyperlinks = true;
      hyperlinks-file-link-format = "zed://file/{path}:{line}";
      # Style
      file-style = "omit";
      hunk-header-style = "file line-number syntax";
      hunk-header-decoration-style = "omit";
      zero-style = "normal";
      minus-style = "red bold";
      minus-emph-style = "red bold";
      plus-style = "green bold";
      plus-emph-style = "green bold";
      line-numbers-left-style = "black";
      line-numbers-right-style = "black";
      line-numbers-minus-style = "red";
      line-numbers-plus-style = "green";
    };
  };
}
