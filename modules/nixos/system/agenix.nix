{
  configLib,
  inputs,
  pkgs,
  ...
}:

{
  imports = [ inputs.agenix.nixosModules.default ];

  environment.systemPackages = [ inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default ];

  age.secrets = {
    passwordfile-lucas.file = configLib.relativeToRoot "secrets/secrets/passwordfile-lucas.age";
  };
}
