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
	harfbuzz_features = { "dlig=1" },
})
config.font_size = 16

require("mappings").apply(config)
require("tab").apply(config)
-- require("events").setup()

return config
