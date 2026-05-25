{ ... }:

{
  # Enable the OpenSSH daemon
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PermitRootLogin = "no"; # disable root login
      KbdInteractiveAuthentication = false; # disable keyboard-interactive authentication
      PasswordAuthentication = false; # disable password login
    };
  };
}
