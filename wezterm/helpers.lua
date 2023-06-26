local wezterm = require("wezterm")

local M = {}

function M.get_current_working_folder_name(tab)
	local cwd_uri = tab.active_pane.current_working_dir

	cwd_uri = cwd_uri:sub(8)

	local slash = cwd_uri:find("/")
	local cwd = cwd_uri:sub(slash)

	local HOME_DIR = os.getenv("HOME")
	if cwd == HOME_DIR then
		return "~"
	end

	return string.match(cwd, "[^/]+$")
end

function M.get_current_process_name(tab)
	return string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2") or "fish"
end

function M.get_process_icon(process_name)
	local process_icons = {
		["docker"] = wezterm.nerdfonts.dev_docker,
		["nvim"] = wezterm.nerdfonts.custom_vim,
		["vim"] = wezterm.nerdfonts.custom_vim,
		["node"] = wezterm.nerdfonts.dev_nodejs_small,
		["git"] = wezterm.nerdfonts.md_git,
		["lua"] = wezterm.nerdfonts.md_language_lua,
		["beam.smp"] = wezterm.nerdfonts.custom_elixir,
	}

	return process_icons[process_name]
end

return M
