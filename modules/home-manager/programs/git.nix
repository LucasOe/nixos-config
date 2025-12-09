{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "LucasOe";
      user.email = "github@lucasoe.com";

      core.autocrlf = "input";
      diff.tool = "meld";
      difftool."meld".cmd = "meld \"$LOCAL\" \"$REMOTE\"";
      difftool.prompt = false;
      fetch.prune = true;
      init.defaultBranch = "main";
      log.abbrevCommit = true;
      merge.ff = "only";
      merge.tool = "meld";
      merge.conflictStyle = "zdiff3";
      mergetool."meld".cmd = "meld \"$LOCAL\" \"$MERGED\" \"$REMOTE\" --output \"$MERGED\"";
      pull.rebase = true;
      rebase.autosquash = true;
      rerere.autoupdate = true;
      rerere.enabled = true;
      submodule.recurse = true;
    };
  };
}
