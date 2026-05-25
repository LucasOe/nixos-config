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

      # Enforce SSH
      url."git@github.com:".insteadOf = "https://github.com/";
      url."git@gitlab.com:".insteadOf = "https://gitlab.com/";
      url."git@bitbucket.org:".insteadOf = "https://bitbucket.org/";

      # Aliases
      alias = {
        a = "add";
        aa = "add --all";
        amend = "commit --amend --no-edit";
        br = "branch";
        c = "commit";
        ca = "commit -a";
        cam = "commit -a -m";
        cm = "commit -m";
        co = "checkout";
        cob = "checkout -b";
        d = "diff";
        dc = "diff --cached";
        f = "fetch";
        fa = "fetch --all --prune";
        ignore = "update-index --assume-unchanged";
        lg = "log --graph --decorate --pretty=oneline --abbrev-commit";
        pl = "pull";
        pu = "push";
        puf = "push --force-with-lease";
        rb = "rebase";
        rba = "rebase --abort";
        rbc = "rebase --continue";
        rbi = "rebase --interactive";
        rbs = "rebase --skip";
        rh = "reset HEAD";
        rhh = "reset HEAD --hard";
        rs = "restore";
        rst = "restore --staged";
        s = "status";
        ss = "status -s";
        st = "stash";
        sta = "stash apply";
        stl = "stash list";
        sts = "stash save";
        unignore = "update-index --no-assume-unchanged";
      };
    };
  };
}
