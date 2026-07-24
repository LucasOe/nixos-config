# Gaming

The default Steam environment variables for Steam are declared in the [Steam Module](modules/nixos/programs/steam.nix):

| Variable | Value | Support | Description |
|----------|-------|----------|-------------|
| `MANGOHUD` | `1` | All | Enable MangoHud by default. This gets disabled when using `scopebuddy` in preference of `gamescope --mangoapp`[^1]. |
| `PROTON_DLSS_UPGRADE` | `1` | ProtonGE & Proton CachyOS | Force the Latest DLSS Preset |
| `PROTON_DXVK_LOWLATENCY` | `1` | Proton CachyOS | Enable the alternative [dxvk-low-latency](https://github.com/netborg-afps/dxvk-low-latency) fork [^2] |
| `PROTON_ENABLE_WAYLAND` | `1` | ProtonGE & Proton CachyOS | Use native Wayland to reduce input latency [^2]. Disabled the Steam overlay and game recording. |
| `PROTON_LOCAL_SHADER_CACHE` | `1` | Proton CachyOs | Enable per-game shader cache |
| `PROTON_VKD3D_LOWLATENCY` | `1` | Proton CachyOS | Enable the alternative [vkd3d-low-latency](https://github.com/netborg-afps/vkd3d-low-latency) fork |
| `VKD3D_CONFIG` | `descriptor_heap` | Proton CachyOS | Enable the experimental descriptor heap from dxkv-proton [^3] |

In addition, the maximum shader cache size is increased to 10GB.

[^1]: https://github.com/flightlessmango/Mangohud#gamescope
[^2]: https://marco-nett.de/blog/measuring-input-latency-on-linux-x11-vs-wayland-vrr-dxvk/
[^3]: https://github.com/CachyOS/proton-cachyos/releases/tag/cachyos-11.0-20260521-slr

## Gamescope / ScopeBuddy

I prefer using `scopebuddy` over invoking `gamescope` directly to automatically set display resolution along with other defaults arguments.
Refer to the [documentation](https://docs.bazzite.gg/Advanced/scopebuddy/).

# Game Notes

## Hunt Showdown: 1896

| Variable | Value | Description |
|----------|-------|-------------|
| `PROTON_ENABLE_WAYLAND` | `0` | Use XWayland to enable the Steam overlay and game recording |
| `DXVK_NVAPI_VKREFLEX` | `1` | Enables [DXVK-NVAPI's Vulkan Reflex layer](https://github.com/jp7677/dxvk-nvapi#vulkan-reflex-layer) |

## Mirror's Edge

Run with `scopebuddy` to fix letterboxing on ultrawide displays when using Proton 11.0.
Use [Mirror's Edge Tweaks](https://github.com/softsoundd/MirrorsEdgeTweaks) to patch the executable to unlock launch arguments.

```sh
scopebuddy -w 2560 -h 1440 -- %command% -exec=speedrun
```

When using X11, the game always requests 4x anisotropic filtering. Set `d3d9.samplerAnisotropy = 16;` in the DXVK config to fix this.
To increase the MSAA quality enable per-sample rate shading with `d3d9.samplerLodBias = -1.0` and `d3d9.forceSampleRateShading = True;`.

| Variable | Value | Description |
|----------|-------|-------------|
| `DXVK_CONFIG` | `"d3d9.samplerAnisotropy = 16; d3d9.samplerLodBias = -1.0; d3d9.forceSampleRateShading = True;"` | Set DXVK configuration. See above. |

## The Binding of Isaac: Rebirth

Refer to the [REPENTOGON documentation](https://repentogon.com/install.html) for installation and usage:

```sh
echo "PROTON_ENABLE_WAYLAND=0 %command%" | sed 's|isaac-ng.exe|REPENTOGONLauncher/REPENTOGONLauncher.exe|' | sh
```

| Variable | Value | Description |
|----------|-------|-------------|
| `PROTON_ENABLE_WAYLAND` | `0` | Game flickers when using native Wayland |
