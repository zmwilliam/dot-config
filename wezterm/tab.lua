local wezterm = require("wezterm")
local helpers = require("helpers")
local icons = wezterm.nerdfonts

local format_tab_title = function(tab_info)
	local work_dir = helpers.get_current_working_folder_name(tab_info)
	local folder_icon = tab_info.is_active and icons.fa_folder or icons.fa_folder_o
	local zoom_indicator = tab_info.active_pane.is_zoomed and icons.cod_zoom_in or ""

	local title = string.format(" %s %-8s %s ", folder_icon, work_dir, zoom_indicator)
	local index = string.format(" %d ", tab_info.tab_index + 1)

	if tab_info.is_active then
		return {
			{ Attribute = { Intensity = "Bold" } },
			{ Attribute = { Italic = true } },
			{ Text = index },
			{ Background = { Color = "#1a1b26" } },
			{ Foreground = { AnsiColor = "Blue" } },
			{ Text = title },
		}
	end

	return {
		{ Attribute = { Intensity = "Bold" } },
		{ Text = index },
		{ Background = { Color = "#1a1b26" } },
		{ Text = title },
	}
end

local M = {}

function M.apply(config)
	config.hide_tab_bar_if_only_one_tab = false
	config.tab_bar_at_bottom = true
	config.use_fancy_tab_bar = false
	config.show_new_tab_button_in_tab_bar = false
	config.tab_max_width = 50

	wezterm.on("format-tab-title", format_tab_title)
end

return M
