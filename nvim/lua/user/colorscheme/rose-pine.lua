local M = {}

function M.setup(style)
  local status, rose = pcall(require, "rose-pine")
  if not status then
    return
  end

  rose.setup({
    --- @usage 'main' | 'moon'
    dark_variant = style or "main",
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
  })

  vim.cmd("colorscheme rose-pine")
end

return M
