{
  nixpkgs.overlays = [
    (final: prev: {
      firefox-devedition-unwrapped = prev.firefox-devedition-unwrapped.override {
        onnxruntime = prev.onnxruntime.override {
          # CUDA support causes firefox-devedition-unwrapped to rebuild from source
          cudaSupport = false;

          # OpenVINO inherits CUDA support from OpenCV, so override that too
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
