{
  configLib,
  inputs,
  specialArgs,
  username,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.default ];

  # Don't forget to set a password with ‘passwd’
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
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICs7Z+gwkmsOYB3SCyNmpzIbIB/TEp8vn8pyPt24XZCq lucas@olem"
    ];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = specialArgs;

    users.${username} = {
      imports = [ (inputs.import-tree (configLib.relativeToRoot "modules/home-manager")) ];

      home = {
        username = username;
        homeDirectory = "/home/${username}";
      };
    };
  };
}
