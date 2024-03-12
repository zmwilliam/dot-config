local wezterm = require("wezterm")

local M = {}

function M.get_current_working_folder_name(tab_info)
	local cwd_uri = tab_info.active_pane.current_working_dir

	cwd_uri = tostring(cwd_uri):sub(8)

	local slash = cwd_uri:find("/")
	local cwd = cwd_uri:sub(slash)

	local HOME_DIR = os.getenv("HOME")
	if cwd == HOME_DIR then
		return "~"
	end

	return string.match(cwd, "[^/]+$")
end

function M.format_process_name(process_name)
	return string.gsub(process_name, "(.*[/\\])(.*)", "%2")
end

function M.get_current_process_name_from_pane(pane)
	local process_name = pane:get_foreground_process_name()
	wezterm.log_error(process_name)
	return M.format_process_name(process_name) or "fish"
end

function M.get_current_process_name_from_tab(tab_info)
	local process_name = tab_info.active_pane.foreground_process_name
	return M.format_process_name(process_name) or "fish"
end

function M.get_process_icon(process_name)
	local nf = wezterm.nerdfonts
	local process_icons = {
		["docker"] = nf.dev_docker,
		["nvim"] = nf.custom_vim,
		["vim"] = nf.custom_vim,
		["node"] = nf.dev_nodejs_small,
		["git"] = nf.mdi_git or nf.md_git,
		["lua"] = nf.seti_lua or nf.md_language_lua,
		["beam.smp"] = nf.custom_elixir,
		["fish"] = nf.mdi_fish or nf.md_fish,
		["python"] = nf.dev_python
	}

	local lc_process_name = string.lower(process_name)
	return process_icons[lc_process_name] or nf.dev_terminal
end

return M
