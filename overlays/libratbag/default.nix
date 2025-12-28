{
  nixpkgs.overlays = [
    (final: prev: {
      libratbag = prev.libratbag.overrideAttrs (_: {
        version = "unstable-2025-12-28";

        src = prev.fetchFromGitHub {
          owner = "libratbag";
          repo = "libratbag";
          rev = "c5214d26336695d1414a6b4e32697f5b5a835089";
          hash = "sha256-o1lsdJ8QwprpBVUdntjjfV6lPaqhG0rD9ySjf+LXriQ=";
        };
      });

      piper = prev.piper.overrideAttrs (_: {
        version = "unstable-2025-12-28";

        src = prev.fetchFromGitHub {
          owner = "libratbag";
          repo = "piper";
          rev = "48056eb1788cdfbdda67a2360c53b7157782a9b3";
          hash = "sha256-jF7qowV4Ub5MqQBlTDuf7x83RTfMQ/J5DSD74lP02pU=";
        };
      });
    })
  ];
}
