{ ... }:

{
  services.stump = {
    enable = true;
    environment = {
      # https://www.stumpapp.dev/docs/guides/configuration/server-config
      STUMP_ENABLE_UPLOAD = "true";
      STUMP_MAX_FILE_UPLOAD_SIZE = "104857600"; # 100 MB
      STUMP_PDF_RENDER_DPI = "300";
      STUMP_PDF_MAX_DIMENSION = "4096";
    };
  };
}
