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
    "github-access-token".file = configLib.relativeToRoot "secrets/secrets/github-access-token.age";
    "passwordfile-lucas".file = configLib.relativeToRoot "secrets/secrets/passwordfile-lucas.age";
  };
}
