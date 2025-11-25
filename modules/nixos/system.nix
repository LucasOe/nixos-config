# Common system configuration that is being used on all hosts
{ pkgs, ... }:

{
  # Bootloader
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.configurationLimit = 5;
  };

  # Perform garbage collection weekly to maintain low disk usage
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

  # Enable Flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Disable Channels, we're using Flakes instead
  nix.channel.enable = false;

  environment.systemPackages = with pkgs; [
    git # Required for Flakes
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Locale
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "en_IE.UTF-8"; # Use en_IE locale as a replacement for en_DE
  };

  services.printing.enable = true; # Printing
  services.upower.enable = true; # Battery
  programs.gpu-screen-recorder.enable = true; # Recording
  services.playerctld.enable = true; # Media Keys

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Enable the OpenSSH daemon
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no"; # disable root login
      PasswordAuthentication = false; # disable password login
    };
  };

  # Enable Niri
  # Installs xdg-desktop-portal-gnome and gnome-keyring as dependencies
  programs.niri.enable = true;

  # Enable GDM Display Manager
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";

  # Enable Gnome Virtual File System
  # Required by Nautilus
  services.gvfs.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
