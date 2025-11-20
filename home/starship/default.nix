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
        # Git
        "$git_branch"
        "$git_commit"
        "$git_status"
        # Special
        "$nix_shell"
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
          "[](bright-black inverted)"
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
          "[](bright-black inverted)"
          "[ $path ](bg:bright-black $style)"
          "[](bright-black)"
        ];
        repo_root_format = lib.concatStrings [
          "[](bright-black inverted)"
          "[ $before_root_path](bg:bright-black $before_repo_root_style)[$repo_root](bg:bright-black $repo_root_style)[$path ](bg:bright-black $style)"
          "[](bright-black)"
        ];
      };
      # Git
      git_branch = {
        disabled = false;
        # Format
        format = lib.concatStrings [
          "[](bright-green inverted)"
          "[ $symbol$branch ](bg:bright-green black)"
        ];
      };
      git_commit = {
        disabled = false;
        # Settings
        only_detached = true;
        # Format
        format = lib.concatStrings [
          "[](bright-green inverted)"
          "[  $hash$tag ](bg:bright-green black)"
        ];
      };
      git_status = {
        disabled = false;
        # Branch
        ahead = "↑\${count}";
        diverged = "↑\${ahead_count}↓\${behind_count}";
        behind = "↓\${count}";
        conflicted = "🞪\${count}";
        # HEAD
        untracked = "?\${count}";
        modified = "~\${count}";
        staged = "+\${count}";
        deleted = "-\${count}";
        stashed = "\\$\${count}";
        renamed = "»\${count}";
        # Format
        format = lib.concatStrings [
          "([\\[$ahead_behind$all_status\\] ](bg:bright-green black))"
          "[](bright-green)"
        ];
      };
      # Special
      nix_shell = {
        disabled = false;
        # Settings
        symbol = "󱄅";
        # Format
        format = lib.concatStrings [
          "[](blue inverted)"
          "[ $symbol ](bg:blue black)"
          "[](blue)"
        ];
      };
      # The direnv module has problems when using Ghostty!
      direnv = {
        disabled = false;
        # Settings
        allowed_msg = "";
        not_allowed_msg = "";
        denied_msg = "";
        loaded_msg = "";
        unloaded_msg = "";
        # Format
        format = lib.concatStrings [
          "[](blue inverted)"
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
