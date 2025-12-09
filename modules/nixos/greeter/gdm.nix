{ username, ... }:

{
  # Enable GDM Display Manager
  services.displayManager.gdm.enable = true;
  services.displayManager.defaultSession = "niri";

  # Set GDM user profile picture
  # https://discourse.nixos.org/t/setting-the-user-profile-image-under-gnome/36233/7
  systemd.tmpfiles.rules =
    let
      profilepic = builtins.fetchurl {
        # https://docs.gravatar.com/sdk/images/
        name = "face.png";
        url = "https://gravatar.com/avatar/4811e9a1fe2634d1e33dd16a38017974827385c03b19f9f0aac4df95a886db98.png?size=256";
        sha256 = "3888df7fd211bae1231e24dda8f97b3d2c98750852d84546d9a8fbcda363512b";
      };
    in
    [
      # notice the "\\n" we don't want nix to insert a new line in our string, just pass it as \n to systemd
      "f+ /var/lib/AccountsService/users/${username}  0600 root root - [User]\\nIcon=/var/lib/AccountsService/icons/${username}\\n"
      "L+ /var/lib/AccountsService/icons/${username}  - - - - ${profilepic}"
    ];
}
