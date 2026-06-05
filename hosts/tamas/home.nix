{ username, ... }:

{
  home-manager.users.${username} = {
    my.noctalia.gpuMonitoring = true;
  };
}
