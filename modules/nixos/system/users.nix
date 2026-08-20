{
  configLib,
  inputs,
  specialArgs,
  username,
  ...
}:

{
  imports = [ inputs.home-manager.nixosModules.default ];

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
