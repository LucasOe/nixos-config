{ ... }:

{
  boot = {
    # Enable Plymouth
    plymouth.enable = true;

    # Enable "Silent boot"
    # https://wiki.nixos.org/wiki/Plymouth
    # https://wiki.archlinux.org/title/Silent_boot
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      # "splash" # Already set by plymouth.enable
      "rd.udev.log_level=3"
      "rd.systemd.show_status=auto"
    ];

    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
