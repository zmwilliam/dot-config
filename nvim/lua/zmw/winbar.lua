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
    attach_navic = false,
    create_autocmd = false,
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
  vim.api.nvim_create_autocmd({
    "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",

    -- include this if you have set `show_modified` to `true`
    -- "BufModifiedSet",
  }, {
    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    callback = function()
      require("barbecue.ui").update()
    end,
  })
end

return M
