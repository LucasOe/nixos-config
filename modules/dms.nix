{ ... }:

{
  # DankMaterialShell includes:
  # Status Bar: waybar, eww, or custom scripts
  # Notifications: mako, swaync, or dunst
  # App Launcher: rofi, wofi, fuzzel, or tofi
  # Screen Locking: swaylock, hyprlock, or gtklock
  # Idle Management: swayidle, hypridle
  # System Tools: htop, btop, nm-applet, blueman, pavucontrol
  # Audio Control: pavucontrol, pamixer scripts
  # Brightness Control: brightnessctl with custom bindings
  # Clipboard Manager: clipman, cliphist, or wl-clipboard scripts
  # Wallpaper Management: swaybg, swww, hyprpaper, or wpaperd
  # Theming: manually configuring gtk, qt, various apps, bars, compositor gaps and colors
  # Power Management: custom scripts or additional daemons
  # Greeter: gdm, sddm, lightdm, greetd

  # Enable Niri
  programs.niri.enable = true;

  # Dank Greeter
  programs.dankMaterialShell.greeter = {
    enable = true;
    compositor.name = "niri";
    # Sync DankMaterialShell theme with the greeter
    configHome = "/home/lucas";
  };
}
