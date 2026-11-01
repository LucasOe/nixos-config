{ lib, ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        # VCS
        "$vcs"
        # Special
        "$nix_shell"
        "\${custom.nix_shell_adhoc}"
        "$direnv"
        # Character
        "\n"
        "$character"
      ];
      # Username
      username = {
        disabled = false;
        # Settings
        show_always = true;
        # Style
        style_user = "bold bright-green";
        style_root = "bold bright-purple";
        # Format
        format = lib.concatStrings [
          "[](bright-black)"
          "[ $user ](bg:bright-black $style)"
          "[](bright-black)"
        ];
      };
      # Hostname
      hostname = {
        disabled = false;
        # Settings
        ssh_only = true;
        ssh_symbol = "";
        # Format
        format = lib.concatStrings [
          "[](bright-black)"
          "[ $ssh_symbol on $hostname ](bg:bright-black bold bright-green)"
          "[](bright-black)"
        ];
      };
      # Directory
      directory = {
        disabled = false;
        # Settings
        truncation_length = 6;
        truncate_to_repo = true;
        truncation_symbol = "…/";
        # Style
        style = "bright-white";
        read_only_style = "bright-red";
        repo_root_style = "bold bright-yellow";
        # Format
        format = lib.concatStrings [
          "[](bright-black)"
          "[ $path ](bg:bright-black $style)"
          "[](bright-black)"
        ];
        repo_root_format = lib.concatStrings [
          "[](bright-black)"
          "[ $before_root_path](bg:bright-black $before_repo_root_style)[$repo_root](bg:bright-black $repo_root_style)[$path ](bg:bright-black $style)"
          "[](bright-black)"
        ];
      };
      # VCS
      vcs = {
        disabled = false;
        # Settings
        order = [
          "jj"
          "git"
        ];
        git_modules = lib.concatStrings [
          "$git_branch"
          "$git_commit"
          "$git_status"
        ];
        jj_modules = lib.concatStrings [
          "$jj_bookmark"
          "$jj_change"
          "$jj_status"
        ];
      };
      # Git
      git_branch = {
        disabled = false;
        # Format
        format = lib.concatStrings [
          "[](bright-green)"
          "[ $symbol$branch ](bg:bright-green black)"
        ];
      };
      git_commit = {
        disabled = false;
        # Settings
        only_detached = true;
        # Format
        format = lib.concatStrings [
          "[](bright-green)"
          "[  $hash$tag ](bg:bright-green black)"
        ];
      };
      git_status = {
        disabled = false;
        # Settings ($ahead_behind)
        ahead = "↑\${count}";
        behind = "↓\${count}";
        diverged = "↑\${ahead_count}↓\${behind_count}";
        # Settings ($all_status)
        conflicted = "🞪\${count}";
        untracked = "?\${count}";
        stashed = "\\$\${count}";
        modified = "~\${count}";
        staged = "+\${count}";
        renamed = "»\${count}";
        deleted = "-\${count}";
        # Format
        format = lib.concatStrings [
          "([\\[$ahead_behind$all_status\\] ](bg:bright-green black))"
          "[](bright-green)"
        ];
      };
      # JJ
      jj_bookmark = {
        disabled = false;
        # Format
        format = lib.concatStrings [
          "[](bright-green)"
          "[ $symbol$bookmark ](bg:bright-green black)"
        ];
      };
      jj_change = {
        disabled = false;
        # Style
        prefix_style = "bg:bright-green black";
        suffix_style = "bg:bright-green bright-black";
        change_offset_style = "bg:bright-green bold black";
        # Format
        format = lib.concatStrings [
          "[](bright-green)"
          "[ $change ](bg:bright-green black)"
        ];
      };
      jj_status = {
        disabled = false;
        # Settings
        conflicted = "🞪";
        description_empty = "◌";
        immutable = "◆";
        added = "+$count";
        copied = "=$count";
        deleted = "-$count";
        modified = "~$count";
        renamed = "»$count";
        # Format
        format = lib.concatStrings [
          "([\\[$all\\] ](bg:bright-green black))"
          "[](bright-green)"
        ];
      };
      # Nix
      # Only works with `nix-shell` and direnv. See:
      # https://github.com/NixOS/nix/issues/3862
      # https://github.com/NixOS/nix/issues/6677
      nix_shell = {
        disabled = false;
        # Settings
        symbol = "󱄅";
        # Format
        format = lib.concatStrings [
          "[](blue)"
          "[ $symbol ](bg:blue black)"
          "[](blue)"
        ];
      };
      # Detect ad-hoc `nix shell` (no IN_NIX_SHELL, raw /nix/store on PATH).
      # Using custom module instead of `heuristic` to avoid false positives when
      # using Ghostty or Kitty by running it inside a clean bash shell.
      custom.nix_shell_adhoc = {
        when = ''[ -z "$IN_NIX_SHELL" ] && printf '%s' "$PATH" | grep -q "^/nix/store/"'';
        shell = [
          "bash"
          "--noprofile"
          "--norc"
        ];
        symbol = "󱄅";
        # Format
        format = lib.concatStrings [
          "[](blue)"
          "[ $symbol ](bg:blue black)"
          "[](blue)"
        ];
      };
      # Direnv
      direnv = {
        disabled = false;
        # Settings
        allowed_msg = "";
        not_allowed_msg = "";
        denied_msg = "";
        loaded_msg = "";
        unloaded_msg = "";
        # Format
        format = lib.concatStrings [
          "[](blue)"
          "[ $symbol$loaded$allowed ](bg:blue black)"
          "[](blue)"
        ];
      };
      # Character
      character = {
        success_symbol = "[❯](white)";
        error_symbol = "[❯](red)";
      };
    };
  };
}
