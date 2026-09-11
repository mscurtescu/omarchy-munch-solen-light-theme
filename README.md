# Munch Solen Light — an Omarchy theme

A light Omarchy theme built from Edvard Munch’s Aula mural *The Sun* (*Solen*, 1911). Straw halo is the page; rock cleft is the ink; cadmium rays mark focus. Sibling of [Munch Solen Dark](https://github.com/mscurtescu/omarchy-munch-solen-dark-theme).

![Munch Solen Light theme preview](preview.png)

## Install

```bash
omarchy theme install https://github.com/mscurtescu/omarchy-munch-solen-light-theme.git
```

Note: `omarchy theme install` stages git-cloned themes without `*.lua`, so the
solar border in `hyprland.lua` is reported as ignored on that path. To get the
border, link a local checkout instead and apply:

```bash
ln -sfn "$(pwd)" ~/.config/omarchy/themes/munch-solen-light
omarchy theme set munch-solen-light
```

## Palette

| Role | Colour | From the mural |
| --- | --- | --- |
| background | `#F7EED7` | Straw paper |
| surface | `#EFE2BF` | Halo |
| selection | `#EED0BA` | Cadmium wash |
| comment / muted | `#7C6C5B` | Warm earth |
| foreground | `#1A1E32` | Rock cleft |
| bright foreground | `#0E101C` | Deep cleft |
| **accent** | `#C44838` | **Cadmium ray** |
| red | `#B84838` | Ray orange |
| orange | `#C85A38` | Inner spoke |
| yellow | `#7A6E3A` | Chrome yellow, darkened for type |
| green | `#5E7241` | Field / lichen |
| cyan | `#5E6778` | Water |
| blue | `#4F5A72` | Far shore |
| magenta | `#795669` | Violet rock |
| brown | `#7A6044` | Umber cleft |

Semantic roles in `colors.toml` are the source of truth; `color0`–`color15` mirror them. Terminals, Neovim (Aether), btop, Helix, and Chromium are generated from that file on `omarchy theme set`.

## Wallpaper

Same Aula JPEG as the dark sibling (3840×2238, museum frame cropped). Cover-scaling on a 3:2 panel crops the sides and keeps the sun.

This image is **not** MIT. See [License](#license).

## License

Original theme files (configs, this README) are MIT. See `LICENSE`.

The wallpaper and `preview.png` are a reproduction of Edvard Munch, *The Sun* (*Solen*), 1911, University of Oslo Aula (UiO.K.01399, Woll 970). Photograph © Universitetet i Oslo, [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/). Full credit: `backgrounds/NOTICE`.

## Credits

**Wallpaper** — Edvard Munch, *The Sun* (*Solen*), 1911. Photograph © Universitetet i Oslo. [Terms](https://www.uio.no/om/kultur/kunstsamlingen/kopirett.html).

**Inspiration (not the file)** — [@impression_ists, 2026-09-06](https://x.com/impression_ists/status/2096576469157699587).

**Palette roles** — [@MeditateColor, 2026-09-06](https://x.com/MeditateColor/status/2096619280376938824). Hexes were retargeted onto the UiO scan; their annotated graphics are not shipped.

Issues for both Munch Solen themes live in the [dark repo](https://github.com/mscurtescu/omarchy-munch-solen-dark-theme) (shared beads tracker).
