local M = {}

function M.setup(style)
  local status, tokyonight = pcall(require, "tokyonight")
  if not status then return end

  tokyonight.setup({
    style = style or "day", -- `storm`, `moon`, a darker variant `night` and `day`
    transparent = false, -- Enable this to disable setting the background color
    dim_inactive = false, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
  })

  vim.cmd("colorscheme tokyonight")
end

return M
