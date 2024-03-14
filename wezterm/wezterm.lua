local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

--appearence
config.color_scheme = "tokyonight_night"
config.colors = { compose_cursor = "orange" }
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 15

require("tab").apply(config)
require("mappings").apply(config)
require("events").setup()

return config
