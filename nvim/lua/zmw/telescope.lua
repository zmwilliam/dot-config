local M = {}

M.setup = function()
  local status_ok, telescope = pcall(require, "telescope")
  if not status_ok then
    return
  end

  local actions = require "telescope.actions"
  local actions_layout = require "telescope.actions.layout"

  telescope.setup {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { truncate = 3 },
      layout_strategy = "horizontal",
      layout_config = {
        vertical = { width = 0.95 },
      },
      mappings = {
        n = {
          ["q"] = actions.close,
          ["<C-]>"] = actions_layout.toggle_preview,
          ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
        i = {
          ["qq"] = actions.close,
          ["<C-]>"] = actions_layout.toggle_preview,
          ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        },
      },
    },
    pickers = {
      find_files = { previewer = false },
      git_files = { previewer = false },
    }
  }

  telescope.load_extension("file_browser")
  telescope.load_extension("session-lens")
end

-- Falling back to find_files if git_files can't find a .git directory
-- :lua require"zmw.telescope".project_files()
M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then require "telescope.builtin".find_files(opts) end
end

return M
