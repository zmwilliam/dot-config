local M = {}

function M.setup()
  local status, barbecue = pcall(require, "barbecue")
  if not status then
    return
  end

  local icons = require("zmw.icons")
  local kinds = {}
  for key, value in pairs(icons.kind) do
    kinds[key] = vim.trim(value)
  end

  barbecue.setup {
    kinds = kinds,
    modifiers = {
      dirname = ":s?.*??", --show only file name
    },
    symbols = {
      --modified = icons.git.Modified,
      modified = false,
      separator = icons.ui.ChevronRight,
    },
    exclude_filetypes = {
      "alpha",
      "fugitive",
      "help",
      "Markdown",
      "noice",
      "notify",
      "NvimTree",
      "packer",
      "gitcommit",
      "vim",
      ""
    }
  }
end

return M
