{ nixosConfig, ... }:

{
  home.pointerCursor = {
    enable = true;
    package = nixosConfig.theme.cursor.package;
    name = nixosConfig.theme.cursor.name;
    size = nixosConfig.theme.cursor.size;

    x11.enable = true;
  };
}
