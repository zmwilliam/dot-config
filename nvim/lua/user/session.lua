local status, session_manager = pcall(require, 'session_manager')
if not status then
  return
end

session_manager.setup({
  autoload_mode = "Disabled", --Possible values: Disabled, CurrentDir, LastSession
  autosave_last_session = false, -- Automatically save last session on exit.
  autosave_ignore_not_normal = true, -- Plugin will not save a session when no writable and listed buffers are opened.
  autosave_only_in_session = true, -- Always autosaves session. If true, only autosaves after a session is active.
})

local tele_status_ok, telescope = pcall(require, "telescope")
if tele_status_ok then
  telescope.load_extension('sessions')
end

