{
  # Disable CUDA support
  # to avoid rebuild from source when the nixos-cuda binary cache is behind.
  # CUDA support is only used for local AI, which is disabled anyway.
  nixpkgs.overlays = [
    (final: prev: {
      firefox-unwrapped = prev.firefox-unwrapped.override {
        onnxruntime = prev.onnxruntime.override {
          cudaSupport = false;
          openvino = prev.openvino.override {
            opencv = prev.opencv.override {
              enableCuda = false;
            };
          };
        };
      };
    })
    (final: prev: {
      firefox-devedition-unwrapped = prev.firefox-devedition-unwrapped.override {
        onnxruntime = prev.onnxruntime.override {
          cudaSupport = false;
          openvino = prev.openvino.override {
            opencv = prev.opencv.override {
              enableCuda = false;
            };
          };
        };
      };
    })
    (final: prev: {
      firefox-beta-unwrapped = prev.firefox-beta-unwrapped.override {
        onnxruntime = prev.onnxruntime.override {
          cudaSupport = false;
          openvino = prev.openvino.override {
            opencv = prev.opencv.override {
              enableCuda = false;
            };
          };
        };
      };
    })
  ];
}
