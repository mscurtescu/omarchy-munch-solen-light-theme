# Munch Solen — Design notes

Shared design story for the sibling Omarchy themes
[Munch Solen Dark](https://github.com/mscurtescu/omarchy-munch-solen-dark-theme)
and [Munch Solen Light](https://github.com/mscurtescu/omarchy-munch-solen-light-theme).

## Source artwork

Edvard Munch, *The Sun* (*Solen*), 1911. Oil on canvas, University of Oslo
Aula (UiO.K.01399, Woll 970). The shipped wallpaper (`backgrounds/1-solen.jpg`,
3840×2238 sRGB JPEG, museum frame cropped) is a downscaled derivative of the
official University of Oslo reproduction photograph.

## Palette idea

The painting is the light; the chrome is the rock shadow. Cool indigo rock
clefts carry the dark surfaces, cadmium rays mark focus, and the straw halo
carries type. Light inverts the relationship: straw halo becomes the page,
rock cleft the ink, cadmium rays still mark focus.

`colors.toml` is the source of truth in both variants. Semantic role names
(`background`, `foreground`, `accent`, `selection`, `muted`, …) drive Omarchy's
generated outputs (terminals, Neovim via Aether, btop, Helix, Chromium,
`vscode-theme.json`); `color0`–`color15` mirror them for templates and older
integrations. See `README.md` for the per-variant palette tables.

## Signature elements

- **Solar border.** `hyprland.lua` paints active windows with a 3-stop ray
  gradient (cadmium → yellow → umber gold) and loops Hyprland's native
  `borderangle` animation at its slowest speed, so the gradient slowly sweeps
  the window. Inactive windows sit on warm earth.
- **Shell chrome.** Hand-written `shell.toml` carries the same ray gradient
  onto bar, popups, notifications, launcher, menu, polkit, and lock surfaces.
- **Icons / keyboard.** Yaru (`Yaru-yellow` on light) plus a `keyboard.rgb`
  accent.

## Install paths

`omarchy theme install <git-url>` stages git-cloned themes *without* `*.lua`,
so the solar border is reported as ignored on that path. A local checkout
linked under `~/.config/omarchy/themes/` and applied with
`omarchy theme set` stages everything, border included. See `README.md`.

## Licensing split

Original theme files (configs, docs) are MIT (`LICENSE`). The wallpapers
reproduce the UiO photograph, © Universitetet i Oslo, under
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
— full credit in `backgrounds/NOTICE`. `preview.webp` is a desktop
screenshot of the applied theme. ShareAlike applies to adaptations of
the photograph, not to the theme configuration files.

## Credits

- Wallpaper photograph © Universitetet i Oslo
  ([terms](https://www.uio.no/om/kultur/kunstsamlingen/kopirett.html)).
- Inspiration (not shipped files): [@impression_ists, 2026-09-06](https://x.com/impression_ists/status/2096576469157699587).
- Palette roles: [@MeditateColor, 2026-09-06](https://x.com/MeditateColor/status/2096619280376938824)
  — hexes retargeted onto the UiO scan; their annotated graphics are not
  shipped.
