{ ... }:

let
  formatter = {
    language_server = {
      name = "biome";
    };
  };
in
{
  programs.zed-editor = {
    userSettings.languages = {
      "JavaScript" = {
        formatter = formatter;
      };
      "TypeScript" = {
        formatter = formatter;
      };
      "TSX" = {
        formatter = formatter;
      };
    };
  };
}
