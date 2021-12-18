local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local actions_layout = require "telescope.actions.layout"

telescope.setup{
  defaults = {
    prompt_prefix = " ",
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
