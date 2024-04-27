local wezterm = require("wezterm")
local h = require("helpers")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

local random_font_family = h.get_random_entry({
-- "JetBrainsMono Nerd Font",
"MonaspiceNe Nerd Font",
"MonaspiceAr Nerd Font",
"MonaspiceXe Nerd Font",
"MonaspiceRn Nerd Font",
"MonaspiceKr Nerd Font",
})

--appearence
config.color_scheme = "tokyonight_night"
config.colors = { compose_cursor = "orange" }
config.font = wezterm.font(random_font_family)
config.font_size = 18

require("mappings").apply(config)
require("tab").apply(config)
-- require("events").setup()

return config
