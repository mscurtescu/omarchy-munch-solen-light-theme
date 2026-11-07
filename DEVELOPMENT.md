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
`backgrounds/NOTICE`). The repo ships WebP only; the quality-92 JPEG master
stays out of the tree. Crops are cut from the master at fixed offsets, then
everything is encoded without upscaling:

```bash
magick master-1-solen.jpg -crop 1700x1700+1262+90 +repage -quality 92 2-solen-disk.jpg
magick master-1-solen.jpg -crop 1600x1000+0+0 +repage -quality 92 3-solen-rays.jpg

for f in 1-solen 2-solen-disk 3-solen-rays; do
  magick "$f.jpg" -strip -resize '3840>' -quality 82 -define webp:method=6 "backgrounds/$f.webp"
done
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

## Hyprland

`colors.toml` carries the ray gradient in `hyprland_active_border` and
`hyprland_inactive_border`. Omarchy regenerates `hyprland.lua` from those
keys when it applies a theme installed from git, so the gradient still
paints. That generated file does not set the shadow or the slow
`borderangle` loop.

The block below is that surface. It sets the active and inactive border
on normal windows and on groups, a short shadow, and one full rotation
of the gradient. `speed = 100` is Hyprland's slowest loop. Layout, binds,
and input stay upstream.

It cannot live in this repo as `hyprland.lua` or as `hyprland.lua.example`.
Hyprland loads `hyprland.lua` at login, so `omarchy theme install` drops
every `*.lua` from a cloned theme. The Omarchy site audit rejects a
script anywhere in the tree, and a `.example` suffix does not change
that. A checkout symlinked under `~/.config/omarchy/themes/` is your own
theme and is staged in full, so save the block there as `hyprland.lua`
when you want the shadow and the rotating border.

```lua
-- Munch Solen Light — Hyprland theme surface.
--
-- Visual values only. Layout, binds, and input stay upstream.
-- Active windows wear the rays (cadmium → yellow → umber gold). Inactive
-- windows sit on warm earth. A slow borderangle loop turns the gradient
-- like the disk; disable that leaf on battery if the redraw shows up.

local cadmium = "c44838"
local yellow = "c8b040"
local gold = "7a6e3a"
local earth = "7c6c5b"
local umber = "7a6044"

local active_border_color = {
	colors = {
		"rgba(" .. cadmium .. "ee)",
		"rgba(" .. yellow .. "ee)",
		"rgba(" .. gold .. "dd)",
	},
	angle = 90,
}
local inactive_border_color = "rgba(" .. earth .. "99)"

hl.config({
	general = {
		col = {
			active_border = active_border_color,
			inactive_border = inactive_border_color,
		},
	},

	group = {
		col = {
			border_active = active_border_color,
			border_inactive = inactive_border_color,
		},
	},

	decoration = {
		shadow = {
			enabled = true,
			range = 14,
			render_power = 3,
			offset = "0 3",
			color = "rgba(" .. umber .. "55)",
			color_inactive = "rgba(" .. umber .. "33)",
		},
	},
})

-- One full rotation of the ray gradient; speed 100 is Hyprland's slowest loop.
hl.animation({ leaf = "borderangle", enabled = true, speed = 100, bezier = "linear", style = "loop" })
```

## Tickets (Beads)

Issue tracking is Beads (`bd`), pin in `.mise.toml` (1.2.2). The shared
database lives in the dark repo; this repo carries a `.beads/redirect`
there — run `bd` commands here normally, push from the dark checkout.
Issue IDs use the `solen-` prefix; `bd ready` lists unblocked work.

### New clone

Clone both theme repos as siblings. The light repo's `.beads/redirect`
is `../omarchy-munch-solen-dark-theme/.beads`.

In the dark repo:

```bash
mise install
bd dolt pull
bd hooks install --beads
```

`mise install` provides `bd` 1.2.2. `bd dolt pull` fetches the issue
database. `bd hooks install --beads` writes `.beads/hooks/` and sets
`core.hooksPath` to that directory. Those scripts are gitignored.
Commit, merge, checkout, and push in the dark repo then call Beads.
Run `bd` from either checkout.

## Releasing

Move `CHANGELOG.md` `[Unreleased]` entries into a dated version section,
push, then annotated tag (`vX.Y.Z`) + push tags. Note: `omarchy theme
update` pulls branch tips, so tags are informational for humans.
Directory listing goes through the `omacom/omarchy-site` fork at
`~/Projects/github.com/omacom/omarchy-site` (branch per submission, PR
from there).
