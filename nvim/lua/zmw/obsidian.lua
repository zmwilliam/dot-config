local M = {}

function M.setup()
  local status_ok, obsidian = pcall(require, "obsidian")
  if not status_ok then
    return
  end

  obsidian.setup {
    dir = "~/workspace/obsidian",
    notes_subdir = "notes",
    daily_notes = { folder = "notes/dailies" },
    completion = { nvim_cmp = true }
  }
end

return M
