local M = {}

function M.setup(style)
  local status, tokyonight = pcall(require, "tokyonight")
  if not status then return end

  local transparent = false

  tokyonight.setup({
    style = style or "day", -- `storm`, `moon`, a darker variant `night` and `day`
    transparent = transparent, -- Enable this to disable setting the background color
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
    styles = {
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = transparent and "transparent" or "dark",
      floats = transparent and "transparent" or "dark",
    },
    on_highlights = function(hl, c)
      if transparent then
        hl.LineNr = { fg = c.dark3 }
        hl.CursorLineNr = { fg = c.dark5 }
      end
    end
  })

  vim.cmd("colorscheme tokyonight")
end

return M
