{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    niri
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
    displayManager.sessionPackages = [ pkgs.niri ];
    displayManager.defaultSession = "niri";
  };

  # https://github.com/niri-wm/niri/blob/main/resources/niri.service
  systemd.packages = [ pkgs.niri ];

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
    configPackages = [ pkgs.niri ];
  };

  # Recommended by upstream
  # https://github.com/YaLTeR/niri/wiki/Important-Software#portals
  programs.dconf.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.graphical-desktop.enable = true;

  services.xserver.desktopManager.runXdgAutostartIfNone = true;
}
