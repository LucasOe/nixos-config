{ username, ... }:

{
  # Networking
  networking.hostName = "mihali";
  my.networking.nextdns.id = "fcc66c";

  # Headless
  my.gui.enable = false;

  # Keymap
  services.xserver.xkb.layout = "eu";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "Lucas Oelker";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJQfqJnnqE7DxuGPh1ia7DlsoZMSenVPq2ND0X34dvBo lucas@tamas"
    ];
  };

  # Automatically log in at the virtual consoles.
  services.getty.autologinUser = "lucas";

  # Required for booting
  # Taken from:
  # https://github.com/NixOS/nixpkgs/blob/master/nixos/modules/installer/sd-card/sd-image-aarch64.nix
  boot = {
    kernelParams = [
      "console=tty0"
    ];

    initrd.availableKernelModules = [
      "pcie-brcmstb" # required for the pcie bus to work
      "reset-raspberrypi" # required for vl805 firmware to load
    ];

    loader = {
      # Use U-Boot via extlinux for Raspberry Pi booting
      generic-extlinux-compatible.enable = true;
      # Disabled in favor of U-Boot
      grub.enable = false;
      systemd-boot.enable = false;
    };
  };

  # Use 4GB of additional swap memory in order to not run out of memory
  # when installing lots of things while running other things at the same time.
  swapDevices = [
    {
      device = "/swapfile";
      size = 4096;
    }
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home-manager.users.${username}.home.stateVersion = "26.05";
}
