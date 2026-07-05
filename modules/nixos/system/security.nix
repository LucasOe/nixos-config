{ pkgs, ... }:

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

  # Override run0 to disable the background
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "run0" ''
      exec ${pkgs.systemd}/bin/run0 --background= "$@"
    '')
  ];
}
