{ nixosConfig, ... }:

{
  nix = {
    # nh doesn't use the token from /etc/nix/nix.conf
    # See: https://github.com/nix-community/nh/issues/720
    extraOptions = ''
      !include ${nixosConfig.age.secrets."github-access-token".path}
    '';
  };
}
