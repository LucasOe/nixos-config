{
  nixpkgs.overlays = [
    (final: prev: {
      # https://github.com/ValveSoftware/gamescope/issues/1924
      gamescope = prev.gamescope.overrideAttrs (old: {
        NIX_CFLAGS_COMPILE = [ "-fno-fast-math" ];

        # Force disable MangoHud. Use `gamescope --mangoapp` instead.
        #
        # Set env via the wrapper so it takes precedence over Steams `extraEnv`.
        # `programs.gamescope.env` uses `--set-default` instead of `--set`.
        postInstall = (old.postInstall or "") + ''
          wrapProgram "$out/bin/gamescope" \
            --set MANGOHUD 0
        '';
      });
    })
  ];
}
