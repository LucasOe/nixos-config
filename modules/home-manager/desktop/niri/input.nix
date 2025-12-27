{ ... }:

{
  programs.niri.settings = {
    input = {
      mouse = {
        # https://wayland.freedesktop.org/libinput/doc/latest/pointer-acceleration.html
        accel-speed = 0.5;
        accel-profile = "flat";
      };
    };
  };
}
