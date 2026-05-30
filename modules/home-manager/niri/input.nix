{ ... }:

{
  # https://niri-wm.github.io/niri/Configuration%3A-Input.html
  wayland.windowManager.niri.settings = {
    input = {
      mouse = {
        # https://wayland.freedesktop.org/libinput/doc/latest/pointer-acceleration.html
        accel-speed = 0.0;
        accel-profile = "flat";
      };
      touchpad = {
        tap = [ ]; # Tap to click
        dwt = [ ]; # Disable touchpad while typing
        dwtp = [ ]; # Disable touchpad while trackpoint is in use
        natural-scroll = [ ]; # Inverse the scrolling direction
      };
    };
  };
}
