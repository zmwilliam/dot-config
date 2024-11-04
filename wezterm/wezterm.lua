local wezterm = require("wezterm")
local h = require("helpers")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local monaspace = {
	"Monaspace Argon",
	"Monaspace Krypton",
	"Monaspace Neon",
	"Monaspace Radon",
	"Monaspace Xenon",
}

local random_font_family = h.get_random_entry(monaspace)

config.color_scheme = "tokyonight_night"
config.colors = { compose_cursor = "orange" }
config.font = wezterm.font({
	family = random_font_family,
	harfbuzz_features = {
		"calt=1",
		"ss01=1",
		"ss02=1",
		"ss03=1",
		"ss04=1",
		"ss05=1",
		"ss06=1",
		"ss07=1",
		"ss08=1",
		"ss09=1",
		"liga=1",
	},
})
config.font_size = 18

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "1.2cell",
	bottom = "0.5cell",
}

config.window_background_opacity = 1
config.macos_window_background_blur = 0
config.text_background_opacity = 1

config.max_fps = 144

require("mappings").apply(config)
require("tab").apply(config)
-- require("events").setup()

return config
