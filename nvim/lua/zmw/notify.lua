local M = {}

function M.setup()
  local onRequireOk = require("zmw.utils").onRequireOk

  onRequireOk("notify", function(notify)
    notify.setup({
      --timeout = 1500,
      max_width = 70,
      --background_colour = "#000000",
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { focusable = false })
      end
    })
    vim.notify = notify
  end)

  onRequireOk("telescope", function(telescope)
    telescope.load_extension("notify")
  end)
end

return M
