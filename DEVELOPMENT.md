# Development

## Live loop

Work in this repo, preview via symlink (never edit the staged copy):

```bash
ln -sfn "$(pwd)" ~/.config/omarchy/themes/munch-solen-light
omarchy theme set munch-solen-light
```

Run `theme set` from your own terminal, not an automation shell — its
terminal-restart hook kills the caller's session. Restaging picks up new
`backgrounds/` files and regenerates app configs from `colors.toml`;
already-running apps (nvim, btop) keep the old palette until restarted.

## Wallpapers

Derivatives of the UiO Aula photograph (CC BY-NC-SA 4.0, see
`backgrounds/NOTICE`). ImageMagick recipes, quality 92, no upscaling:

```bash
magick 1-solen.jpg -crop 1700x1700+1262+90 +repage -quality 92 2-solen-disk.jpg
magick 1-solen.jpg -crop 1600x1000+0+0 +repage -quality 92 3-solen-rays.jpg
```

Generate once, copy byte-identical into both repos — both variants share
the mural set unless a crop suits one mode specifically.

## Screenshots

- Desktop (`preview.webp`): staged 2×2 tiling (nvim + Neo-tree, btop,
  terminal `ls`, Nautilus Home); the focused window wears the active
  border. Capture fullscreen, then
  `magick shot.png -resize 1800x1200 -strip -quality 82`.
- Empty desktop (`wallpaper*.webp`): bare workspace, bar visible; 1280
  wide, WebP q82.
- Gallery (omarchy-site directory): 16:9 top-anchored crop of the desktop
  shot → 1200×675, q75–80, under ~100KB per the site README spec.

## Badges

README badges: official `tcballard/omarchy-badges` category art (pinned
commit URLs, never float `main`), static MIT + CC BY-NC-SA artwork
shields, `Omarchy Quattro` generation marker. No numeric version claims;
the tested build is noted in the README if anywhere.

## Tickets (Beads)

Issue tracking is Beads (`bd`), pin in `.mise.toml` (1.2.2). The shared
database lives in the dark repo; this repo carries a `.beads/redirect`
there — run `bd` commands here normally, push from the dark checkout.
Issue IDs use the `solen-` prefix; `bd ready` lists unblocked work.

## Releasing

Move `CHANGELOG.md` `[Unreleased]` entries into a dated version section,
push, then annotated tag (`vX.Y.Z`) + push tags. Note: `omarchy theme
update` pulls branch tips, so tags are informational for humans.
Directory listing goes through the `omacom/omarchy-site` fork at
`~/Projects/github.com/omacom/omarchy-site` (branch per submission, PR
from there).
