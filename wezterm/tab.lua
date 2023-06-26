local wezterm = require("wezterm")
local helpers = require("helpers")
local icons = wezterm.nerdfonts

local format_tab_title = function(tab)
	local index = tab.tab_index + 1
	local work_dir = helpers.get_current_working_folder_name(tab)
	local process_name = helpers.get_current_process_name(tab)
	local folder_icon = tab.is_active and icons.fa_folder or icons.fa_folder_o
	local zoom_indicator = tab.active_pane.is_zoomed and " " or ""

	local title = string.format(" %s: (%s) %s %s %s", index, process_name, folder_icon, work_dir, zoom_indicator)

	if tab.is_active then
		return {
			{ Attribute = { Intensity = "Bold" } },
			{ Attribute = { Italic = true } },
			{ Text = title },
		}
	end

	return title
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
