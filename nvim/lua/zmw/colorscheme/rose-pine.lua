local M = {}

function M.setup(variant)
  local status, rose = pcall(require, "rose-pine")
  if not status then
    return
  end

  rose.setup({
    --- @usage 'main' | 'moon' | 'dawn'
    dark_variant = variant or "main",
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
    groups = { border = 'iris' }
  })

  if variant == "dawn" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end

  vim.cmd("colorscheme rose-pine")
end

return M
