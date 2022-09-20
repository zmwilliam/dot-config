local M = {}

local function set_keymaps()
  local whichkey = require("which-key")

  local keymap_window = {
    name = "Window",
    a = { "<Cmd>WindowsToggleAutowidth<CR>", "Toggle auto width" },
    z = { "<Cmd>WindowsMaximize<CR>", "Max zoom" },
  }

  whichkey.register(keymap_window, { prefix = "<C-w>" })
end

function M.setup()
  local status_ok, windows = pcall(require, "windows")
  if not status_ok then
    return
  end

  vim.o.winwidth = 10
  vim.o.winminwidth = 10
  vim.o.equalalways = false

  windows.setup({
    autowidth = {
      enable = false,
      winwidth = 5,
    },
    ignore = {
      buftype = { "quickfix" },
      filetype = { "NvimTree", "alpha" }
    },
    animation = {
      enable = true,
      duration = 100,
      easing = "in_out_sine"
    }
  })

  set_keymaps()
end

return M
