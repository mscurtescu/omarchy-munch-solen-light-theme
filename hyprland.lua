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
