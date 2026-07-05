{ ... }:

{
  security = {
    run0 = {
      enable = true;
      enableSudoAlias = true;
      persistentAuth = {
        enable = true;
        enableRemote = true;
      };
    };

    sudo = {
      enable = false;
      extraConfig = ''
        Defaults pwfeedback # password input feedback - makes typed password visible as asterisks
        Defaults timestamp_timeout=120 # only ask for password every 2h
      '';
    };
  };

  environment.shellAliases = {
    run0 = "run0 --background=''";
    sudo = "sudo --run0-extra-arg=--background=''";
  };
}
