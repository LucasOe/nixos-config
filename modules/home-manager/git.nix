{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitMinimal;
    lfs.enable = true;

    signing = {
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      signByDefault = true;
    };

    # https://git-scm.com/docs/git-config
    settings = {
      user.name = "LucasOe";
      user.email = "github@lucasoe.com";

      core.autocrlf = "input";
      core.editor = "zeditor --wait";
      difftool.prompt = false;
      fetch.prune = true;
      format.pretty = "oneline";
      init.defaultBranch = "main";
      log.abbrevCommit = true;
      log.decorate = "short";
      merge.conflictStyle = "zdiff3";
      merge.ff = "only";
      mergetool.prompt = false;
      pull.rebase = true;
      rebase.autosquash = true;
      rerere.autoupdate = true;
      rerere.enabled = true;
      status.branch = true;
      status.short = true;
      submodule.recurse = true;

      # Diff tool
      diff.tool = "zed";
      difftool.meld.cmd = "meld \"$LOCAL\" \"$REMOTE\"";
      difftool.vscode.cmd = "code --wait --diff \"$LOCAL\" \"$REMOTE\"";
      difftool.zed.cmd = "zeditor --wait --diff \"$LOCAL\" \"$REMOTE\"";

      # Merge tool
      merge.tool = "zed";
      mergetool.meld.cmd = "meld \"$LOCAL\" \"$MERGED\" \"$REMOTE\" --output \"$MERGED\"";
      mergetool.vscode.cmd = "code --wait \"$MERGED\"";
      mergetool.zed.cmd = "zeditor --wait \"$MERGED\"";

      # Enforce SSH
      url."git@github.com:".insteadOf = "https://github.com/";
      url."git@gitlab.com:".insteadOf = "https://gitlab.com/";
      url."git@bitbucket.org:".insteadOf = "https://bitbucket.org/";

      # Aliases
      alias = {
        # Status
        st = "status";
        s = "status";
        # Log
        lg = "log";
        l = "log";
        # Add
        a = "add";
        aa = "add --all";
        # Commit
        c = "commit";
        ca = "commit -a";
        cm = "commit -m";
        cam = "commit -a -m";
        amend = "commit --amend --no-edit";
        # Rebase
        rb = "rebase";
        rba = "rebase --abort";
        rbc = "rebase --continue";
        rbi = "rebase --interactive";
        rbs = "rebase --skip";
        # Ignore
        ignore = "update-index --assume-unchanged";
        unignore = "update-index --no-assume-unchanged";
      };
    };
  };

  home.shellAliases = {
    g = "git";
  };
}
