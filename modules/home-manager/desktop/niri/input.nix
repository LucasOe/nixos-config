{ ... }:

{
  programs.niri.settings = {
    input = {
      mouse = {
        # https://wayland.freedesktop.org/libinput/doc/latest/pointer-acceleration.html
        accel-speed = 0.0;
        accel-profile = "flat";
      };
      touchpad = {
        dwt = true; # Disable touchpad while typing
        dwtp = true; # Disable touchpad while trackpoint is in use
      };
    };
  };
}
