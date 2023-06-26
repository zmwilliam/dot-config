local M = {}

function M.setup()
  local status_ok, session = pcall(require, "auto-session")
  if not status_ok then
    return
  end

  session.setup {
    auto_session_create_enabled = false,
    auto_restore_enabled = true,
    auto_session_use_git_branch = true,
    auto_session_suppress_dirs = { "~/", "~/Downloads" },
    session_lens = {
      theme_conf = { border = true },
      previewer = false,
      path_display = { 'shorten' },
    }
  }
end

function M._truncate(s, size)
  if string.len(s) >= size then
    return string.sub(s, 1, size) .. "..."
  end

  return s
end

function M.session_name()
  local ok, session_lib = pcall(require, "auto-session-library")
  if not ok then
    return false
  end


  local session_name = session_lib.current_session_name()
  return "祥" .. M._truncate(session_name, 15)
end

return M
