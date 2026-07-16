{
  config,
  lib,
  nixosConfig,
  pkgs,
  ...
}:

let
  cfg = config.my.gpu-screen-recorder;
in
{
  options.my.gpu-screen-recorder = {
    enable = lib.mkEnableOption "GPU Screen Recorder" // {
      default = nixosConfig.my.gpu-screen-recorder.enable;
      defaultText = lib.literalExpression "config.my.gpu-screen-recorder.enable";
    };

    captureTarget = lib.mkOption {
      type = lib.types.str;
      default = "portal";
      description = ''
        Specify what to record. For example:
        - portal - Use the xdg-desktop-portal
        - screen - Record the first monitor found
        - Monitor name (e.g., DP-1) - Record specific monitor
      '';
    };

    duration = lib.mkOption {
      type = lib.types.int;
      default = 60;
      description = "Duration of the replay in seconds";
      example = 60;
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.user.services.gpu-screen-recorder = {
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };

      Unit = {
        Description = "GPU Screen Recorder Service";
        BindsTo = [ "graphical-session.target" ];
        PartOf = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
        Requisite = [ "graphical-session.target" ];
      };

      Service = {
        Type = "simple";
        # https://git.dec05eba.com/gpu-screen-recorder/about/
        # For explanations see `man gpu-screen-recorder`
        # Note: `-fm content` only works when capturing with desktop portal
        ExecStart = ''
          ${lib.getExe pkgs.gpu-screen-recorder} \
            -w "${cfg.captureTarget}" \
            -restore-portal-session "yes" \
            -c "mkv" \
            -k "h264" \
            -ac "opus" \
            -a "app-inverse:spotify|app-inverse:noctalia-sound" \
            -a "default_output" \
            -a "default_input" \
            -f "60" \
            -fm "content" \
            -r "${lib.toString cfg.duration}" \
            -o "${config.home.homeDirectory}/Videos/Replays" \
            -ro "${config.home.homeDirectory}/Videos/Recordings" \
            -q "50000" \
            -bm "cbr" \
            -v "no"
        '';
      };
    };

    wayland.windowManager.niri.settings.binds = lib.mkIf config.wayland.windowManager.niri.enable {
      # Start/Stop Recording
      "Mod+F9".spawn = "${pkgs.writeShellScript "toggle-recording" ''
        pkill -SIGRTMIN -f gpu-screen-recorder -H
        sleep 0.1
        STATUS=$(journalctl --user -e -u gpu-screen-recorder -n 2 -o cat --no-pager | grep -m1 recording || echo "Error")
        ${lib.getExe pkgs.libnotify} -e "GPU Screen Recorder" "$STATUS"
      ''}";

      # Save replay for full duration
      "Mod+F10".spawn = "${pkgs.writeShellScript "save-replay" ''
        pkill -SIGUSR1 -f gpu-screen-recorder -H
        sleep 0.1
        ${lib.getExe pkgs.libnotify} -e "GPU Screen Recorder" "Replay saved"
      ''}";
    };
  };
}
