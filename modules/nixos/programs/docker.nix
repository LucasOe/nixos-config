{ ... }:

{
  virtualisation.docker = {
    enable = false; # Disable the system wide Docker daemon
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
