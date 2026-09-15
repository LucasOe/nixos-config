{
  config,
  lib,
  options,
  pkgs,
  ...
}:

let
  cfg = config.my.niri;
in
{
  options.my.niri = {
    enable = lib.mkEnableOption "niri" // {
      default = config.my.gui.enable;
      defaultText = lib.literalExpression "config.my.gui.enable";
    };

    package = lib.mkOption {
      type = options.programs.niri.package.type;
      default = config.programs.niri.package;
      defaultText = lib.literalExpression "config.programs.niri.package";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cfg.package
      xwayland-satellite
    ];

    # Required for xdg-desktop-portal-gnome's FileChooser to work properly
    services.dbus.packages = [
      pkgs.nautilus
    ];

    # GDM 50 falls back to launching "gnome-session" as the user
    # session command when neither AccountsService nor displayManager
    # .defaultSession pins one.
    services = {
      displayManager.sessionPackages = [ cfg.package ];
      displayManager.defaultSession = "niri";
    };

    # https://github.com/niri-wm/niri/blob/main/resources/niri.service
    systemd.packages = [ cfg.package ];

    # Restarting the compositor kills the graphical session; same
    # treatment as the display-manager modules.
    systemd.user.services.niri = {
      restartIfChanged = false;
      # Defining the unit here generates a drop-in; without this it
      # would carry the NixOS default Environment="PATH=coreutils:…",
      # clobbering the PATH that niri-session imported into the user
      # manager and breaking spawn actions that rely on it.
      enableDefaultPath = false;
    };

    # XDG Desktop Portal
    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
      ];
      # https://github.com/niri-wm/niri/blob/main/resources/niri-portals.conf
      configPackages = [ cfg.package ];
    };

    # Recommended by upstream
    # https://github.com/YaLTeR/niri/wiki/Important-Software#portals
    programs.dconf.enable = true;
    security.polkit.enable = true;
    services.gnome.gnome-keyring.enable = true;
    services.graphical-desktop.enable = true;

    services.xserver.desktopManager.runXdgAutostartIfNone = true;
  };
}
