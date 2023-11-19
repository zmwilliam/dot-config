local wezterm = require("wezterm")
local helpers = require("helpers")

local function set_right_status(window)
	local workspace_name = window:active_workspace()
	local session_icon = wezterm.nerdfonts.md_dock_window
	local text = string.format(" %s %s ", session_icon, workspace_name)

	window:set_right_status(wezterm.format({
		{ Attribute = { Intensity = "Half" } },
		{ Text = text },
	}))
end

local function set_left_status(window, pane)
	local process_name = helpers.get_current_process_name_from_pane(pane)
	local icon = helpers.get_process_icon(process_name)
	window:set_left_status(wezterm.format({
		{ Background = { AnsiColor = "Blue" } },
		{ Foreground = { AnsiColor = "Grey" } },
		{ Text = " " },
		{ Text = icon },
		{ Text = " " },
		{ Text = process_name },
		{ Text = " " },
	}))
end

local M = {}

function M.setup()
	wezterm.on("update-status", function(window, active_pane)
		set_right_status(window)
		set_left_status(window, active_pane)
	end)
end

return M
