{ pkgs, username, ... }:

{
  # Enable networking
  networking.hostName = "tamas";

  # Keymap
  services.xserver.xkb.layout = "eu";

  # Disable Intel HD Audio
  # https://docs.kernel.org/sound/alsa-configuration.html#module-snd-hda-intel
  boot.blacklistedKernelModules = [ "snd_hda_intel" ];

  # CPU frequency scaling
  powerManagement.cpuFreqGovernor = "performance";
  services.power-profiles-daemon.enable = true;

  # Enable ratbagd for configuring gaming mice
  services.ratbagd.enable = true;

  # Custom options
  my.maccel.enable = true;
  my.nvidia.enable = true;
  my.openvpn.enable = true;
  my.steam.enable = true;
  my.via.enable = true;

  # System Packages
  environment.systemPackages = with pkgs; [
    bottles
    heroic
    piper
  ];

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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICs7Z+gwkmsOYB3SCyNmpzIbIB/TEp8vn8pyPt24XZCq"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home-manager.users.${username}.home.stateVersion = "25.05";
}
