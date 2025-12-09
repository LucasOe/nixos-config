{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "LucasOe";
      user.email = "github@lucasoe.com";

      core.autocrlf = "input";
      core.editor = "zeditor --wait";
      diff.tool = "zed";
      difftool.meld.cmd = "meld \"$LOCAL\" \"$REMOTE\"";
      difftool.prompt = false;
      difftool.vscode.cmd = "code --wait --diff \"$LOCAL\" \"$REMOTE\"";
      difftool.zed.cmd = "zeditor --wait --diff \"$LOCAL\" \"$REMOTE\"";
      fetch.prune = true;
      init.defaultBranch = "main";
      log.abbrevCommit = true;
      merge.conflictStyle = "zdiff3";
      merge.ff = "only";
      merge.tool = "zed";
      mergetool.meld.cmd = "meld \"$LOCAL\" \"$MERGED\" \"$REMOTE\" --output \"$MERGED\"";
      mergetool.prompt = false;
      mergetool.vscode.cmd = "code --wait \"$MERGED\"";
      mergetool.zed.cmd = "zeditor --wait \"$MERGED\"";
      pull.rebase = true;
      rebase.autosquash = true;
      rerere.autoupdate = true;
      rerere.enabled = true;
      submodule.recurse = true;
    };
  };
}
