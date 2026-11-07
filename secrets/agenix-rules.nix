# Agenix CLI recipient rules.
# This file is consumed by the agenix CLI, not imported into the NixOS configuration.
# Docs: https://ryantm.github.io/agenix/

let
  # SSH host keys from `/etc/ssh/ssh_host_ed25519_key.pub`.
  # Used by the corresponding NixOS hosts for runtime decryption.
  mihali = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOFOj+vIFd3ldvHXTZgC15oAlKEulKImZD8OmFDoXKRN";
  olem = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILw1GZ26X4XMZY66GL4clVHZtRP2ve/LzATPPEN2pntv";
  tamas = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDoQU9STJo0u9ZxrfnGPh0JjkGpXxrX1AnKwe3+c1/M9";

  # SSH user key from `~/.ssh/id_ed25519.pub`.
  # Used for local secret management with the agenix CLI.
  # Only lucas@tamas is authorized to decrypt secrets with a user key by default.
  # On other machines, specify this identity explicitly using `agenix -i <private-key>`.
  admin = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJQfqJnnqE7DxuGPh1ia7DlsoZMSenVPq2ND0X34dvBo lucas@tamas";
in
{
  "secrets/passwordfile-lucas.age".publicKeys = [
    admin
    mihali
    olem
    tamas
  ];
  "secrets/github-access-token.age".publicKeys = [
    admin
    mihali
    olem
    tamas
  ];
  "secrets/cloudflare-caddy.age".publicKeys = [
    admin
    mihali
  ];
}
