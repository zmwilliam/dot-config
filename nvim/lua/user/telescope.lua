local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local actions_layout = require "telescope.actions.layout"

telescope.setup{
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    layout_strategy = "vertical",
    layout_config = {
      vertical = { width = 0.95 },
    },
    mappings = {
      n = {
        ["q"] = actions.close,
        ["<C-]>"] = actions_layout.toggle_preview
      },
      i = {
        ["qq"] = actions.close,
        ["<C-]>"] = actions_layout.toggle_preview
      },
    },
  },
  pickers = {
    find_files = { previewer = false },
    git_files = { previewer = false },
  }
}

-- Falling back to find_files if git_files can't find a .git directory
-- :lua require"user.telescope".project_files()
local M = {}

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

return M
