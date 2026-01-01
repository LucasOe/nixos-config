# Common system configuration that is being used on all hosts
{ inputs, pkgs, ... }:

{
  imports = [
    ./greeter/gdm.nix
    ./programs/nextdns.nix
    ./programs/nh.nix
    ./shell/fish.nix
    ./stylix.nix
  ];

  boot = {
    # Plymouth
    plymouth.enable = true;

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
    # Hide the OS choice for bootloaders.
    # It's still possible to open the bootloader list by pressing any key
    # It will just not appear on screen unless a key is pressed
    loader.timeout = 0;

    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 5;
    };
  };

  nix.settings = {
    # Enable Flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    # Add substituters
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://niri.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
    ];

    # Add sudo users as trusted, so nixos-rebuild works
    trusted-users = [
      "root"
      "@wheel"
    ];
  };

  # Disable Channels, we're using Flakes instead
  nix.channel.enable = false;

  environment.systemPackages = with pkgs; [
    git # Required for Flakes
    xwayland-satellite # xwayland support
    gpu-screen-recorder-gtk # GUI app
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
  programs.gpu-screen-recorder.enable = true; # Recording
  services.playerctld.enable = true; # Media Keys
  services.resolved.enable = true; # DNS
  programs.dconf.enable = true; # dconf

  # Enable sound with PipeWire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  # Enable the OpenSSH daemon
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no"; # disable root login
      KbdInteractiveAuthentication = false; # disable keyboard-interactive authentication
      PasswordAuthentication = false; # disable password login
    };
  };

  # Enable Niri
  programs.niri.enable = true;
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.package = pkgs.niri-unstable;

  # Enable Gnome Virtual File System
  # Required by Nautilus
  services.gvfs.enable = true;

  # Allow dynamically linked libraries
  # Required by vscode-server
  programs.nix-ld.enable = true;

  # Enable Docker
  virtualisation.docker = {
    enable = true;
  };

  # Sudo
  security.sudo.extraConfig = ''
    Defaults pwfeedback # password input feedback - makes typed password visible as asterisks
    Defaults timestamp_timeout=120 # only ask for password every 2h
  '';
}
