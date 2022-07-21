local M = {}

function M.setup()
  local status_ok, session = pcall(require, "auto-session")
  if not status_ok then
    return
  end

  session.setup()

  require('session-lens').setup({
    path_display = { 'shorten' },
  })
end

function M.session_name()
  local ok, session_lib = pcall(require, "auto-session-library")
  --local no_session = "精NO SESSION"
  return ok and "祥" .. session_lib.current_session_name()
end

return M
